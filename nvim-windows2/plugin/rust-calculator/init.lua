-- initialize the channel

if calculatorJobId == Nil then
    calculatorJobId = 0
end

noti = require('notify')

-- The path to the binary
calculatorBin = "/Users/c86j2/My Documents/local/rust-calculator/target/debug/rust-calculator.exe"

-- Entry point. Initialize RPC. If it succeeds, then attach commands to the 'rpcnotify' invocation.
function entryPoint()
    local id = initRpc()

    if 0 == id then
        vim.fn.echoerr("calculator: cannot start rpc process")
        return
    end

    if id == -1 then
        vim.fn.echoerr("calculator: rpc process is not executable")
        return
    end

    -- Mutate our jobId variable to hold the channel Id
    calculatorJobId = id

    registerCommands()
end

-- Initialize RPC

function initRpc()
    if calculatorJobId ~= 0 then
        return calculatorJobId
    end

    local jobId = vim.fn.jobstart({ calculatorBin }, { rpc = true })
    return jobId
end

function registerCommands() 
    vim.api.nvim_create_user_command(
        'Add', 
        function(opts)
            vim.fn.rpcrequest(calculatorJobId, 'add', opts.fargs)
        end,
        { nargs = '+' })
end

-- call Entry point.
entryPoint()
