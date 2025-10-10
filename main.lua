-- SmartDelete Plugin for KOReader
-- Description: Overrides FileManager.showDeleteFileDialog to ask before deleting bookmarks/history

local _ = require("gettext")
local BD = require("ui/bidi")
local InputContainer = require("ui/widget/container/inputcontainer")
local InfoMessage = require("ui/widget/infomessage")
local ConfirmBox = require("ui/widget/confirmbox")
local BookList = require("ui/widget/booklist")

local UIManager = require("ui/uimanager")
local ffiUtil = require("ffi/util")
local lfs = require("libs/libkoreader-lfs")

local _t = require("i18n")

local T = ffiUtil.template

local SmartDelete = InputContainer:extend({
    name = "SmartDelete"
})


local function isFile(file)
    return lfs.attributes(file, "mode") == "file"
end

function SmartDelete:init()
    -- Lazy-load FileManager (avoid requiring too early)
    local FileManager = require("apps/filemanager/filemanager")

    -- Backup original function
    if not FileManager._original_showDeleteFileDialog then
        FileManager._original_showDeleteFileDialog = FileManager.showDeleteFileDialog
    end

    -- Override function
    FileManager.showDeleteFileDialog = function(table, filepath, post_delete_callback, pre_delete_callback)
        local file = ffiUtil.realpath(filepath)
        if file == nil then
            UIManager:show(InfoMessage:new {
                text = T(_("File not found:\n%1"), BD.filepath(filepath)),
                icon = "notice-warning",
            })
            return
        end
        local is_file = isFile(file)
        local text = (is_file and _("Delete file permanently?") or _("Delete folder permanently?")) ..
            "\n\n" .. BD.filepath(file)
        if is_file and BookList.hasBookBeenOpened(file) then
            text = text .. "\n\n" .. _("Book settings, highlights and notes will be deleted.")
            .. "\n\n" .. _t("Delete only will remove your file but keep all other information intact.")
        end

        local other_buttons = { {
                {
                    text = _t("Delete Only"),
                    callback = function()
                        if pre_delete_callback then
                            pre_delete_callback()
                        end
                        if os.remove(file) and post_delete_callback then
                            post_delete_callback()
                        end
                    end,
                },
            } }


        UIManager:show(ConfirmBox:new {
            text = text,

            ok_text = _("Delete"),
            ok_callback = function()
                if pre_delete_callback then
                    pre_delete_callback()
                end
                if self:deleteFile(file, is_file) and post_delete_callback then
                    post_delete_callback()
                end
            end,

            other_buttons = other_buttons
        })
    end
end

return SmartDelete
