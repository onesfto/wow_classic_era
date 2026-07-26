local function DumpRegions()
    if TradeSkillFrame then
        for i, region in ipairs({TradeSkillFrame:GetRegions()}) do
            if region:GetObjectType() == "FontString" then
                print(region:GetName(), region:GetText())
            end
        end
    end
end
