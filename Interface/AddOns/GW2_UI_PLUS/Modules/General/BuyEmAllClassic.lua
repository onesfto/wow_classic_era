local _, addonTable = ...

-- GW2PlusBuyEmAll Classic

GW2PlusBuyEmAll = {}

local L = GW2PLUS_BUYEMALL_LOCALS;

-- These are used for the text on the Max and Stack buttons. See GW2PlusBuyEmAll.xml.

GW2PLUS_BUYEMALL_MAX = L.MAX;
GW2PLUS_BUYEMALL_STACK = L.STACK;

-- It's ALIVE!!! Muahahahahhahahaa!!!!!

function GW2PlusBuyEmAll:OnLoad()
    -- Set up confirmation dialog.

    StaticPopupDialogs["GW2PLUS_BUYEMALL_CONFIRM"] = {
        preferredIndex = 3,
        text = L.CONFIRM,
        button1 = YES,
        button2 = NO,
        OnAccept = function(dialog) self:DoPurchase(dialog.data) end,
        timeout = 0,
        hideOnEscape = true,
    };
    self.ConfirmNoItemLink = 0;
    StaticPopupDialogs["GW2PLUS_BUYEMALL_CONFIRM2"] = {
        preferredIndex = 3,
        text = L.CONFIRM,
        button1 = YES,
        button2 = NO,
        OnAccept = function(dialog) BuyMerchantItem(self.ConfirmNoItemLink) end,
        timeout = 0,
        hideOnEscape = true,
    };

    -- Clear textures and text to prevent pink textures.

    GW2PlusBuyEmAllCurrency1:SetTexture();
    GW2PlusBuyEmAllCurrency2:SetTexture();
    GW2PlusBuyEmAllCurrency3:SetTexture();
    GW2PlusBuyEmAllCurrencyAmt1:SetText();
    GW2PlusBuyEmAllCurrencyAmt2:SetText();
    GW2PlusBuyEmAllCurrencyAmt3:SetText();

    self.OrigMerchantItemButton_OnModifiedClick = MerchantItemButton_OnModifiedClick;
    MerchantItemButton_OnModifiedClick = function(frame, button)
        self:MerchantItemButton_OnModifiedClick(frame, button);
    end

    self.OrigMerchantFrame_OnHide = MerchantFrame:GetScript("OnHide");
    MerchantFrame:SetScript("OnHide", function(...)
        return self:MerchantFrame_OnHide(...);
    end)

    SLASH_GW2PLUS_BUYEMALL1 = "/gw2buyemall"
    SlashCmdList["GW2PLUS_BUYEMALL"] = function(message, editbox)
        GW2PlusBuyEmAll:SlashHandler(message);
    end
end


function GW2PlusBuyEmAll:SlashHandler(message, editbox)
    if (message == "") then
        print("GW2PlusBuyEmAll: Use /buyemall confirm to enable/disable the large purchase confirm.");
    elseif (message == "confirm") then
        if (GW2PlusBEAConfirmToggle == true) then
            GW2PlusBEAConfirmToggle = false;
            print("GW2PlusBuyEmAll: Large purchase confirm window disabled.");
        elseif (GW2PlusBEAConfirmToggle == false) then
            GW2PlusBEAConfirmToggle = true;
            print("GW2PlusBuyEmAll: Large purchase confirm window enabled.");
        end
    end
end

-- Variable setup/check.

local BEAframe = CreateFrame("FRAME", "BEAFrame");
BEAframe:Hide();
BEAframe:RegisterEvent("ADDON_LOADED");
local function eventHandler(self, event, ...)
    local arg1, arg2, arg3, arg4, arg5 = ...;
    if (event == "ADDON_LOADED") and (arg1 == "GW2_UI_PLUS") then
        if (GW2PlusBEAConfirmToggle == nil) then
            GW2PlusBEAConfirmToggle = true;
        elseif (GW2PlusBEAConfirmToggle == 0) then
            GW2PlusBEAConfirmToggle = false;
        elseif (GW2PlusBEAConfirmToggle == 1) then
            GW2PlusBEAConfirmToggle = true;
        end
    end
end

BEAframe:SetScript("OnEvent", eventHandler);

-- Makes sure the GW2PlusBuyEmAll frame goes away when you leave a vendor.

function GW2PlusBuyEmAll:MerchantFrame_OnHide(...)
    GW2PlusBuyEmAllFrame:Hide();
    return self.OrigMerchantFrame_OnHide(...);
end

--function GW2PlusBuyEmAll:CogsFreeBagSpace(itemID)
    --local freeSpace = 0;
    --local itemSubType = GetItemFamily(itemID);
    --local stackSize = select(8, GetItemInfo(itemID));

    --for theBag = 0, 4 do
        --local doBag = true;

        --if (theBag > 0) then -- 0 is always the backpack.
        --local bagLink = GetInventoryItemLink("player", 19 + theBag); -- Bag #1 is in inventory slot 20.
        --if (bagLink) then
            --local bagSubType = GetItemFamily(bagLink);
            --if (bagSubType == itemSubType) then
                --doBag = true;
            --elseif (bagSubType == 0) then
                --doBag = true;
            --elseif (bit.band(itemSubType, bagSubType) == bagSubType) then
                --doBag = true;
            --else doBag = false;
            --end
        --else
            --doBag = false;
        --end
        --end

        --if (doBag) then
            --local numSlot = C_Container.GetContainerNumSlots(theBag);
            --for theSlot = 1, numSlot do
                --local itemLink = C_Container.GetContainerItemLink(theBag, theSlot);
                --if not (itemLink) then
                    --freeSpace = freeSpace + stackSize;
                --elseif (strfind(itemLink, "item:" .. itemID .. ":")) then
                    --local _, itemCount = C_Container.GetContainerItemInfo(theBag, theSlot);
                    --if (not itemCount) then
                        --freeSpace = freeSpace + stackSize
                    --else
                        --freeSpace = freeSpace + stackSize - itemCount;
                    --end
                --end
            --end
        --end
    --end
    --return freeSpace, stackSize;
--end


-- Hooks left-clicks on merchant item buttons.

function GW2PlusBuyEmAll:MerchantItemButton_OnModifiedClick(frame, button)
    local general = addonTable and addonTable.General
    if general and general.GetDB and not general.GetDB().batchBuy then
        return self.OrigMerchantItemButton_OnModifiedClick(frame, button)
    end
    self.itemIndex = frame:GetID();
    -- Don't think this is needed anymore.
    --if ChatFrame1EditBox:HasFocus() then ChatFrame1EditBox:Insert(GetMerchantItemLink(frame:GetID()));

    if (MerchantFrame.selectedTab == 1)
            and (IsShiftKeyDown())
            and not (IsControlKeyDown())
            and not (ChatFrame1EditBox:HasFocus()) then
        -- Set up various data before showing the GW2PlusBuyEmAll frame.

        -- Misc variables for help with error logs.
        self.NPCName = UnitName("npc");

        self.AltCurrencyMode = false;
        self.AtVendor = true; -- Currently at the vendor, for later purchase interruption.

        local name, texture, price, quantity, numAvailable = GetMerchantItemInfo(self.itemIndex);
        local maxStack = GetMerchantItemMaxStack(self.itemIndex);
        self.itemName = name;
        self.price = price;
        self.preset = quantity;
        self.available = numAvailable;
        self.itemLink = GetMerchantItemLink(self.itemIndex);
        

        -- Bypass for purchasable things without an itemlink, don't know any other way right now.

        if (self.itemLink == nil) then
            self.ConfirmNoItemLink = self.itemIndex;
            local dialog = StaticPopup_Show("GW2PLUS_BUYEMALL_CONFIRM2", quantity, self.itemName);
            return
        end

        -- Buying a currency with a currency! Thanks to recent changes, this should cover all cases.

        if ((strmatch(self.itemLink, "currency")) and (self.price == 0)) then
            local totalMax = select(6, GetCurrencyInfo(self.itemLink));
            if (totalMax == 0) then -- 0 meaning no set maximum, so set how much one can fit super high.
                self.fit = 10000000;
            elseif (totalMax > 0) then -- Double check and make sure the total max of currency is above 0 then set the fit to that. Just in case.
                self.fit = totalMax;
            end
            self.stack = self.preset;
            self:AltCurrencyHandling(self.itemIndex, frame);
            return
        end
        
        
        if (strmatch(self.itemLink, "item")) then -- Check if purchase is an item and setup the needed variables.
            local _,itemID = strsplit(":", self.itemLink);
            itemID = tonumber(itemID);
            self.itemID = itemID;
            self.stack = maxStack;
            local bagMax = 0; -- max items we could purchase which would fit in bag
            for bag = 0, 4 do
                local numSlots = C_Container.GetContainerNumSlots(bag);
                for slot = 1,numSlots do
                    local Location = ItemLocation:CreateFromBagAndSlot(bag, slot);
                    if (Location and C_Item.DoesItemExist(Location)) then
                        -- there's an item in this bag
                        local bagItemID = C_Item.GetItemID(Location);
                        if (bagItemID== itemID) then 
                            -- same item as one we're purchasing, adjust bagMax
                            local itemInfo = C_Container.GetContainerItemInfo(bag,slot);
                            bagMax = bagMax + maxStack - itemInfo.stackCount;
                        else
                            -- some other item in this slot, unusable
                        end
                    else
                        --open slot could fit a whole stack
                        bagMax = bagMax + maxStack;
                    end
                end
            end
            self.fit = bagMax;
            self.partialFit = self.fit % self.stack;
        elseif (strmatch(self.itemLink, "currency")) then -- Same for if the purchase is a currency.
            self.stack = self.preset;
            if (select(6, GetCurrencyInfo(self.itemLink)) == 0) then
                self.fit = 10000000;
                self.partialFit = 0;
            end
            self.partialFit = select(6, GetCurrencyInfo(self.itemLink)) - select(2, GetCurrencyInfo(self.itemLink));
        end

        if ((select(8, GetMerchantItemInfo(self.itemIndex)) == true) and (self.price == 0)) then -- Checks for alternate currency information then passes purchase to handler.
            self:AltCurrencyHandling(self.itemIndex, frame);
            return
        end

        GW2PlusBuyEmAllCurrency1:SetTexture("Interface\\MONEYFRAME\\UI-GoldIcon");
        GW2PlusBuyEmAllCurrency2:SetTexture("Interface\\MONEYFRAME\\UI-SilverIcon"); -- Once known it's a standard transaction, use regular money textures.
        GW2PlusBuyEmAllCurrency3:SetTexture("Interface\\MONEYFRAME\\UI-CopperIcon");


        -- Modified to check for free items. Mostly for the PTR/Beta servers, but it shouldn't hurt to leave it in.
        -- Put after the alternate currency trigger to prevent issues. Always had it here, just adding the note.

        if (self.price == 0) then
            self.afford = self.fit;
        else
            self.afford = floor(GetMoney() / ceil(self.price / self.preset));
        end

        self.max = min(self.fit, self.afford);
        if (numAvailable > -1) then
            self.max = min(self.max, numAvailable);
        end
        if (self.max == 0) then
            return
        elseif (self.max == 1) then
            MerchantItemButton_OnClick(frame, "LeftButton");
            return
        end

        self.defaultStack = quantity;
        self.split = 1;

        self:SetStackClick();
        self:Show(frame);
    else
        self.OrigMerchantItemButton_OnModifiedClick(frame, button);
    end
end

-- Processor for Alternate Currencies. I think I got it compact as it can be.

function GW2PlusBuyEmAll:AltCurrencyHandling(itemIndex, frame)
    self.AltCurrencyMode = true;

    self.NumAltCurrency = GetMerchantItemCostInfo(itemIndex);
    
    self.AltCurrTex = {};
    self.AltCurrPrice = {};
    self.AltCurrAfford = {};
    
    for i = 1, self.NumAltCurrency do
        self.AltCurrPrice[i] = select(2, GetMerchantItemCostItem(itemIndex, i));
        local Link = select(3, GetMerchantItemCostItem(itemIndex, i));
        if (strmatch(Link, "currency")) then -- Item/Currency link check
            self.AltCurrTex[i] = select(1, GetMerchantItemCostItem(itemIndex, i)); -- Get the currency texture for later display.
            self.AltCurrAfford[i] = floor(select(2, GetCurrencyInfo(Link)) / self.AltCurrPrice[i]) * self.preset; -- Calculate how many can be purchased.
        else
            self.AltCurrTex[i] = select(1, GetMerchantItemCostItem(itemIndex, i)); -- Get the currency texture for later display.
            self.AltCurrAfford[i] = floor((GetItemCount(tonumber(strmatch(Link, "item:(%d+):")), true)) / self.AltCurrPrice[i]) * self.preset; -- Calculate how many can be purchased.
        end
    end
    
    if (NumAltCurrency == 1) then
        self.afford = self.AltCurrAfford[1];
    else
        self.afford = min(self.AltCurrAfford[1], self.AltCurrAfford[2] or 999999, self.AltCurrAfford[3] or 999999); -- Used Min so if there's not 3 currencies, the others won't be called on.
    end

    self.max = min(self.fit, self.afford);

    if (self.available > -1) then
        self.max = min(self.max, self.available * self.preset);
    end

    if (self.max == 0) then
        return
    elseif (self.max == 1) then
        MerchantItemButton_OnClick(frame, "LeftButton");
        return
    end

    self.defaultStack = self.preset;
    self.split = self.defaultStack;

    self.partialFit = self.fit % self.stack;
    self:SetStackClick();

    -- Misc variables for help with error logs.

    self.NPCName = UnitName("npc");
    self.ItemName = select(1, GetMerchantItemInfo(self.itemIndex));

    self:Show(frame);
end

-- Prepare the various UI elements of the GW2PlusBuyEmAll frame and show it.

function GW2PlusBuyEmAll:Show(frame)
    self.typing = false;
    GW2PlusBuyEmAllLeftButton:Disable();
    GW2PlusBuyEmAllRightButton:Enable();

    GW2PlusBuyEmAllStackButton:Enable();
    if (self.max < self.stackClick) then
        GW2PlusBuyEmAllStackButton:Disable();
    end

    GW2PlusBuyEmAllFrame:ClearAllPoints();
    GW2PlusBuyEmAllFrame:SetPoint("BOTTOMLEFT", frame, "TOPLEFT", 0, 0);

    GW2PlusBuyEmAllFrame:Show(frame);
    self:UpdateDisplay();
end


-- If the amount is more than stack and defaultStack, show a confirmation. Otherwise, do the purchase.

function GW2PlusBuyEmAll:VerifyPurchase(amount)
    amount = amount or self.split;
    
    if (self.AltCurrencyMode == true) then
        amount = self:AltCurrRounding(amount);
    end
    
    if (amount > 0) then
        -- amount = (amount / self.preset) * self.preset; Leaving this here just in case, but commenting it out because as far as I can tell and test, it does nothing.
        if (amount > self.stack) and (amount > self.defaultStack) then
            if (GW2PlusBEAConfirmToggle == true) then
                self:DoConfirmation(amount);
            else
                self:DoPurchase(amount);
            end
        else
            self:DoPurchase(amount);
        end
    end
end

-- The outer layers of this code are from Treeston on the MMO-Champion forums, and modified to suit my needs. Link: https://is.gd/25JTV1

local framePurchAmount, frameNumLoops, frameLeftover = 0, 0, 0; -- Have to use locals because the whole self bit doesn't work in this function. Fun fact, that still goes over my head. ;.;
local frameItemIndex;

local PurchaseLoopFrame = CreateFrame("Frame");
function GW2PlusBuyEmAll:onUpdate(sinceLastUpdate)
    self.sinceLastUpdate = (self.sinceLastUpdate or 0) + sinceLastUpdate;
    if (self.sinceLastUpdate >= 0.5) then -- In seconds, this being half a second.
        if (frameNumLoops == 0) and (frameLeftover == 0) then
            PurchaseLoopFrame:SetScript("OnUpdate", nil); -- When purchasing is done, clear the script so it's not running constantly.
            return
        end
        if (frameNumLoops == 0) and (frameLeftover ~= 0) then
            BuyMerchantItem(frameItemIndex, frameLeftover);
            frameLeftover = 0;
        elseif (frameNumLoops > 0) then
            BuyMerchantItem(frameItemIndex, framePurchAmount);
            frameNumLoops = frameNumLoops - 1;
        end
        self.sinceLastUpdate = 0;
    end
end

-- End of code from Treeston.

-- Makes the actual purchase(s)
function GW2PlusBuyEmAll:DoPurchase(amount)
    GW2PlusBuyEmAllFrame:Hide();
    local numLoops, purchAmount, leftover;

    if (amount <= self.stack) then
        purchAmount = amount;
        numLoops = 1;
        leftover = 0;
    else
        if (amount % self.stack) > 0 then
            purchAmount = self.stack;
            numLoops = floor(amount / self.stack);
            leftover = amount % self.stack;
        else
            purchAmount = self.stack;
            numLoops = floor(amount / self.stack);
            leftover = 0;
        end
    end

    framePurchAmount = purchAmount;
    frameNumLoops = numLoops;
    if (leftover == 0) then
        frameLeftover = 0;
    else
        frameLeftover = leftover;
    end
    frameItemIndex = self.itemIndex;

    PurchaseLoopFrame:SetScript("OnUpdate", GW2PlusBuyEmAll.onUpdate);
end

-- Rounds the alternate currency purchase amount, if needed, to the nearest multiple of the preset stack.

function GW2PlusBuyEmAll:AltCurrRounding(purchase)
    local singleCost = 0;
    local amount = purchase;
    for i = 1, self.NumAltCurrency do   -- Checks the alternate currencies used if any is used once.
        if (self.AltCurrPrice[i] == 1) then
            singleCost = 1;
        end
    end
    if (singleCost) then    -- Checks if the previous result is true, if so, the purchase can't be less than the preset amount.
        if ((purchase % self.preset) < (self.preset / 2)) then  -- Rounding down.
            amount = purchase - (purchase % self.preset);
            return amount;
        elseif ((purchase % self.preset) >= (self.preset / 2)) then -- Rounding up.
            amount = purchase + (self.preset - (purchase % self.preset));
            return amount;
        end
    else
        return amount;
    end 
end

-- Changes the money display to however much amount of the item will cost. If amount is not specified, it uses the current split value.

function GW2PlusBuyEmAll:UpdateDisplay()
    GW2PlusBuyEmAllLeftButton:Enable();
    GW2PlusBuyEmAllRightButton:Enable();
    GW2PlusBuyEmAllMaxButton:Enable();
    if (self.split == self.max) then
        GW2PlusBuyEmAllRightButton:Disable();
        GW2PlusBuyEmAllMaxButton:Disable();
    end
    if (self.AltCurrencyMode == false) and (self.split == 1) then
        GW2PlusBuyEmAllLeftButton:Disable();
    end
    if (self.AltCurrencyMode == true) and (self.split == self.preset) then
        GW2PlusBuyEmAllLeftButton:Disable();
    end

    self:SetStackClick();
    GW2PlusBuyEmAllStackButton:Enable();
    if (self.max < self.stackClick) then
        GW2PlusBuyEmAllStackButton:Disable();
    end
    
    local purchase = self.split;
    
    if (self.AltCurrencyMode == false) then
        local cost = 0;
        if (self.defaultStack > 1) then
            cost = purchase * (self.price / self.defaultStack);
        else
            cost = purchase * self.price;
        end
        cost = ceil(cost);
        local gold = floor(abs(cost / 10000));
        local silver = floor(abs(mod(cost / 100, 100)));
        local copper = floor(abs(mod(cost, 100)));

        GW2PlusBuyEmAllCurrencyAmt1:SetText(gold);
        GW2PlusBuyEmAllCurrencyAmt2:SetText(silver);
        GW2PlusBuyEmAllCurrencyAmt3:SetText(copper);
    elseif (self.AltCurrencyMode == true) then
        
        local amount = self:AltCurrRounding(purchase);
        self.AltNumPurchases = amount / self.preset; -- Adjustment for not being able to buy less than the preset of items using alternate currency.
        
        GW2PlusBuyEmAllCurrencyAmt1:SetText(self.AltNumPurchases * self.AltCurrPrice[1]);
        GW2PlusBuyEmAllCurrency1:SetTexture(self.AltCurrTex[1]);
        GW2PlusBuyEmAllCurrencyAmt2:SetText(self.AltNumPurchases * (self.AltCurrPrice[2] or 0));
        GW2PlusBuyEmAllCurrency2:SetTexture(self.AltCurrTex[2]);
        if (self.AltCurrPrice[2] == nil) then GW2PlusBuyEmAllCurrencyAmt2:SetText() end
        GW2PlusBuyEmAllCurrencyAmt3:SetText(self.AltNumPurchases * (self.AltCurrPrice[3] or 0));
        GW2PlusBuyEmAllCurrency3:SetTexture(self.AltCurrTex[3]);
        if (self.AltCurrPrice[2] == nil) then GW2PlusBuyEmAllCurrencyAmt3:SetText() end
    end

    GW2PlusBuyEmAllText:SetText(self.split);
end


-- Shows the confirmation dialog.

function GW2PlusBuyEmAll:DoConfirmation(amount)
    local dialog = StaticPopup_Show("GW2PLUS_BUYEMALL_CONFIRM", amount, self.itemName);
    dialog.data = amount;
end


-- Calculates the amount that the Stack button will enter.

function GW2PlusBuyEmAll:SetStackClick()
    local increase = (self.partialFit == 0 and self.stack or self.partialFit) - (self.split % self.stack);
    self.stackClick = self.split + (increase == 0 and self.stack or increase);
end

function GW2PlusBuyEmAll:DeStackClick()
    local decrease = tonumber(GW2PlusBuyEmAllText:GetText());
    if (decrease <= self.stack) then
        self.split = 1;
        self:UpdateDisplay();
    else
        self.split = decrease - self.stack;
        self:UpdateDisplay();
    end
end


-- OnClick handler for the four main buttons.

function GW2PlusBuyEmAll:OnClick(frame, button)
    if (frame == GW2PlusBuyEmAllOkayButton) then
        local amount = tonumber(GW2PlusBuyEmAllText:GetText());
        self:VerifyPurchase(amount);
    elseif (frame == GW2PlusBuyEmAllCancelButton) then
        GW2PlusBuyEmAllFrame:Hide();
    elseif (frame == GW2PlusBuyEmAllStackButton) then
        if (button == "LeftButton") then
            self.split = self.stackClick;
            self:UpdateDisplay();
            if (frame:IsEnabled() == true) then
                self:OnEnter(frame);
            else
                GameTooltip:Hide();
            end
        elseif (button == "RightButton") then
            self:DeStackClick();
            self:UpdateDisplay();
            if (frame:IsEnabled() == true) then
                self:OnEnter(frame);
            else
                GameTooltip:Hide();
            end
        end
    elseif (frame == GW2PlusBuyEmAllMaxButton) then
        self.split = self.max;
        self:UpdateDisplay();
    end
end


-- Allows you to type a number to buy. This is adapted directly from the Default UI's code.

function GW2PlusBuyEmAll:OnChar(text)
    if (text < "0") or (text > "9") then    -- If input is not a number, then stop/ignore it.
        return
    end

    if (self.typing == false) then  -- Note down that typing is starting and set the input variable to 0.
        self.typing = true;
        self.split = 0;
    end
    
    
    local input = (self.split * 10) + text; -- Adds a local variable to hold the input numbers and keep track of them.

    if (input == self.split) then   -- Checks if the input number is the same as the current value, if so it calls to update the UI and exits.
        if (self.split == 0) then   -- Checks if the current value is 0, if so it sets it to 1.
            self.split = 1;
        end
        self:UpdateDisplay();
        return
    end
    if (input <= self.max) then -- If the input is smaller than or equal to the maximum that can be purchased, set the UI to the input number.
        self.split = input;
    elseif (input > self.max) then  -- If the input is larger than the maximum purchase somehow, push it back to the maximum.
        self.split = self.max;
    elseif (input <= 0) then    -- If the input is somehow a negative number, push it back to 1.
        self.split = 1;
    end
    self:UpdateDisplay();
end


-- Key handler for keys other than 0-9.

function GW2PlusBuyEmAll:OnKeyDown(key)
    if (key == "BACKSPACE") or (key == "DELETE") then
        if (self.typing == false) or (self.split == 1) then
            return
        end

        self.split = floor(self.split / 10);
        if (self.split <= 1) then
            self.split = 1;
            self.typing = false;
        end

        self:UpdateDisplay();
    elseif (key == "ENTER") then
        self:VerifyPurchase();
    elseif (key == "ESCAPE") then
        GW2PlusBuyEmAllFrame:Hide();
    elseif (key == "LEFT") or (key == "DOWN") then
        GW2PlusBuyEmAll:Left_Click();
    elseif (key == "RIGHT") or (key == "UP") then
        GW2PlusBuyEmAll:Right_Click();
    elseif (key == "PRINTSCREEN") then
        Screenshot();
    end
end


-- Decreases the amount by however much is necessary to go down to the next lowest multiple of the preset stack size.

function GW2PlusBuyEmAll:Left_Click()
    if (self.AltCurrencyMode == false) then
        self.split = self.split - 1;
        self:UpdateDisplay();
    else
        self.split = self.split - self.preset;
        self:UpdateDisplay();
    end
end


-- Increases the amount by however much is necessary to go up to the next highest multiple of the preset stack size.

function GW2PlusBuyEmAll:Right_Click()
    if (self.AltCurrencyMode == false) then
        self.split = self.split + 1;
        self:UpdateDisplay();
    else
        self.split = self.split + self.preset;
        self:UpdateDisplay();
    end
end


-- This table is used for the two functions that follow.

GW2PlusBuyEmAll.lines = {
    stack = {
        label = L.STACK_PURCH,
        field = "stackClick",
        { label = L.STACK_SIZE, field = "stack" },
        { label = L.PARTIAL, field = "partialFit" },
    },
    max = {
        label = L.MAX_PURCH,
        field = "max",
        { label = L.AFFORD, field = "afford" },
        { label = L.FIT, field = "fit" },
        {
            label = L.AVAILABLE,
            field = "available",
            Hide = function()
                return GW2PlusBuyEmAll.available <= 1
            end
        },
    },
}


-- Shows tooltips when you hover over the Stack or Max buttons.

function GW2PlusBuyEmAll:OnEnter(frame)
    local lines = self.lines[frame == GW2PlusBuyEmAllMaxButton and "max" or "stack"];

    lines.amount = self[lines.field];
    for i, line in ipairs(lines) do
        line.amount = self[line.field];
    end

    self:CreateTooltip(frame, lines);
end


-- Creates the tooltip from the given lines table. See the structure of lines above for more insight.

function GW2PlusBuyEmAll:CreateTooltip(frame, lines)
    GameTooltip:SetOwner(frame, "ANCHOR_BOTTOMRIGHT");
    GameTooltip:SetText(lines.label .. "|cFFFFFFFF - |r" .. GREEN_FONT_COLOR_CODE .. lines.amount .. "|r");

    for _, line in ipairs(lines) do
        if not (line.Hide and line.Hide()) then
            local color =
            line.amount == lines.amount and GREEN_FONT_COLOR or HIGHLIGHT_FONT_COLOR;
            GameTooltip:AddDoubleLine(line.label, line.amount, 1, 1, 1, color.r, color.g, color.b);
        end
    end

    --SetTooltipMoney(GameTooltip, ceil(lines.amount / self.preset) * self.price);
    -- Need to replace, but also need to understand tooltips more to do so.

    GameTooltip:Show();
end


-- Hides the tooltip.

function GW2PlusBuyEmAll:OnLeave()
    GameTooltip:Hide();

    --GameTooltip_ClearMoney(GameTooltip);
    -- Not needed because of previous commenting out.
end

-- When the GW2PlusBuyEmAll frame is closed, close any confirmations waiting for a response as well as clear the currencies.

function GW2PlusBuyEmAll:OnHide()
    GW2PlusBuyEmAllCurrency1:SetTexture();
    GW2PlusBuyEmAllCurrency2:SetTexture();
    GW2PlusBuyEmAllCurrency3:SetTexture();
    GW2PlusBuyEmAllCurrencyAmt1:SetText();
    GW2PlusBuyEmAllCurrencyAmt2:SetText();
    GW2PlusBuyEmAllCurrencyAmt3:SetText();
    StaticPopup_Hide("GW2PLUS_BUYEMALL_CONFIRM");
end
