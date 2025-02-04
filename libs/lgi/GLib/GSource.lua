---@alias SourceFunc fun(): boolean

---@class (exact) SourceFuncs
---@field check? fun(source: GSource): ready: boolean
---@field dispatch fun(source: GSource, callback?: SourceFunc): continue: boolean
---@field finalize? false
---@field prepare? fun(source: GSource): ready: boolean, timeout: integer?

---@class GSourceStatic
---@operator call(SourceFuncs): GSourceStatic
---@field remove fun(id: integer): boolean

---@class GSource
---@field attach fun(self: GSource, context?: GMainContext): id: integer
---@field destroy fun(self: GSource)
