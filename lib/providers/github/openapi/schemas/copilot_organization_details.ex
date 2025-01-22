defmodule GitHubOpenAPI.CopilotOrganizationDetails do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :cli, Ecto.Enum, values: [:enabled, :disabled, :unconfigured]
    field :ide_chat, Ecto.Enum, values: [:enabled, :disabled, :unconfigured]
    field :plan_type, Ecto.Enum, values: [:business, :enterprise, :unknown]
    field :platform_chat, Ecto.Enum, values: [:enabled, :disabled, :unconfigured]
    field :public_code_suggestions, Ecto.Enum, values: [:allow, :block, :unconfigured, :unknown]
    field :seat_management_setting, Ecto.Enum, values: [:assign_all, :assign_selected, :disabled, :unconfigured]
    embeds_one :seat_breakdown, GitHubOpenAPI.CopilotSeatBreakdown
    field :__info__, :map
    field :__joins__, {:array, :map}
  end

  def changeset(schema, attrs) do
    schema
    |> cast(attrs, [:cli, :ide_chat, :plan_type, :platform_chat, :public_code_suggestions, :seat_management_setting, :__info__, :__joins__])
        |> cast_embed(:seat_breakdown, with: &GitHubOpenAPI.CopilotSeatBreakdown.changeset/2)
  end
end
