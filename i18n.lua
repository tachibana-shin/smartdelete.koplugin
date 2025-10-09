
local _ = require("gettext")

local messages = {
    vi = {
        ["Delete only will remove your file but keep all other information intact."] =
            "Chỉ xóa tệp, giữ nguyên các thông tin khác.",
        ["Delete Only"] = "Chỉ xóa tệp",
        ["Smart Delete"] = "Xóa thông minh",
    },
    ja = {
        ["Delete only will remove your file but keep all other information intact."] =
            "ファイルのみ削除し、他の情報はそのままにします。",
        ["Delete Only"] = "ファイルのみ削除",
        ["Smart Delete"] = "スマート削除",
    }
}

local function _t(s)
    local lang = _.current_lang or "en"
    local langTable = messages[lang]
    if langTable and langTable[s] then
        return langTable[s]
    end
    return s
end

return _t