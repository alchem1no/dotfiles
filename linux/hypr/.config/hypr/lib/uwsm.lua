local M = {}

function M.start_app(app)
    hl.exec_cmd("uwsm app -- " .. app)
end

return M
