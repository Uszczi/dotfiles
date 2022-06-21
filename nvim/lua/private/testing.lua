local testing = require "uszczi.testing"

local function starts_with(str, start)
    return str:sub(1, #start) == start
end

local opts = {
    registered_directory = {
        "/home/mateusz/work/tails"
    },
    testing_commands = {
        function(test_path)
            if starts_with(test_path, "admin") or starts_with(test_path, "lib") then
                test_path = "/app/" .. test_path
                local command =
                    "docker-compose run -p 5678:5678 -e PYTHONPATH=/app -e APPLICATION_STAGE=test -e CI_NAME=foo --rm admin " ..
                    "pytest -s " .. test_path .. " -vvvv"
                return command
            end
        end,
        function(test_path)
            if starts_with(test_path, "vet") then
                test_path = "/app/" .. test_path
                local command =
                    "docker-compose run -p 5678:5678 -e PYTHONPATH=/app -e CONF_MODULE=vet.config.test.test --rm vet " ..
                    "pytest -s " .. test_path .. " -vvvv"
                return command
            end
        end
    },
    debug_commands = {
        function(test_path)
            if starts_with(test_path, "admin") or starts_with(test_path, "lib") then
                test_path = "/app/" .. test_path
                local command =
                    "docker-compose run -p 5678:5678 -e PYTHONPATH=/app -e APPLICATION_STAGE=test -e CI_NAME=foo --rm admin " ..
                    "python -m debugpy --listen 0.0.0.0:5678 --wait-for-client -m " ..
                        "pytest -s " .. test_path .. " -vvvv"
                return command
            end
        end,
        function(test_path)
            if starts_with(test_path, "vet") then
                test_path = "/app/" .. test_path
                local command =
                    "docker-compose run -p 5678:5678 -e PYTHONPATH=/app -e CONF_MODULE=vet.config.test.test --rm vet " ..
                    "python -m debugpy --listen 0.0.0.0:5678 --wait-for-client -m " ..
                        "pytest -s " .. test_path .. " -vvvv"
                return command
            end
        end
    }
}

testing.setup(opts)
