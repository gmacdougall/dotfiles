return function(language_server_path, on_attach)
    local bin_path = "typescript-language-server"
    return {
        cmd = {bin_path, "--stdio" },
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)

            -- formatting is delegated to prettier
            client.resolved_capabilities.document_formatting = false
        end
    }
end
