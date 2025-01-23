import Config

if config_env() == :dev do
  config :oapi_generator,
    # specific to GitHub Provider
    github: [
      output: [
        base_module: GitHubOpenAPI,
        extra_fields: [
          __info__: :map,
          __joins__: {:array, :map}
        ],
        location: "lib/providers/github/openapi",
        operation_subdirectory: "operations/",
        schema_subdirectory: "schemas/",
        schema_use: Apipe.Providers.OpenAPI.Encoder
        # types: [
        #   error: {GitHubOpenAPI.Error, :t}
        # ]
      ]
    ]
end
