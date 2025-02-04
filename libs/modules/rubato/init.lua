---@meta rubato

---@class rubato
---@field timed rubato.timed
---@field easing rubato.easing
local rubato = require 'rubato'

---@class rubato.timed
---@field duration integer # the _total_ duration in seconds of the animation.
---@field rate? integer # the times per second to run animation timer. Higher rates = smoother animations.
---@field prop_intro? boolean # when `true` __intro__, __outro__, and __inter__ represent proportional values. ie: 0.5 = half the |duration|. Default is |false|
---@field pos? integer # the initial position of the animation. Default is |0|
---@field intro integer # The duration of the intro.
---@field outro? integer # The duration of the outro. Defaults to |intro| duration __OR__ duration minus intro if `intro + outro > duration`.
---@field easing? table
---@field easing_outro? table
---@field easing_inter? table
---@field subscribed? function|nil
---@field override_simulate? boolean
---@field rapid_set? unknown
---@field override_dt? boolean
---@field clamp_position? boolean
---@field awestore_compat? boolean #Makes the api even _more_ similar to awestore's api.
---@field log? boolean
---@field debug? unknown
rubato.timed = {}

---@param func function
function rubato.timed:subscribe(func) end

---@param func function
function rubato.timed:unsubscribe(func) end

---Run all subscribed functions at the current position.
---
---The arguments: `pos`, `time`, and `dx` may be provided manually,
---otherwise this function uses the values of the timed object.
---@param pos? any
---@param time? any
---@param dx? any
function rubato.timed:fire(pos, time, dx) end

---Stop the animation at the current position.
function rubato.timed:abort() end
