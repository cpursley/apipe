defmodule GitHubOpenAPI.CopilotOrganizationDetails do
  @moduledoc """
  Provides struct and type for a CopilotOrganizationDetails
  """
  use Apipe.Providers.OpenAPI.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          cli: String.t() | nil,
          ide_chat: String.t() | nil,
          plan_type: String.t() | nil,
          platform_chat: String.t() | nil,
          public_code_suggestions: String.t(),
          seat_breakdown: GitHubOpenAPI.CopilotSeatBreakdown.t(),
          seat_management_setting: String.t()
        }

  defstruct [
    :__info__,
    :__joins__,
    :cli,
    :ide_chat,
    :plan_type,
    :platform_chat,
    :public_code_suggestions,
    :seat_breakdown,
    :seat_management_setting
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cli: {:enum, ["enabled", "disabled", "unconfigured"]},
      ide_chat: {:enum, ["enabled", "disabled", "unconfigured"]},
      plan_type: {:enum, ["business", "enterprise", "unknown"]},
      platform_chat: {:enum, ["enabled", "disabled", "unconfigured"]},
      public_code_suggestions: {:enum, ["allow", "block", "unconfigured", "unknown"]},
      seat_breakdown: {GitHubOpenAPI.CopilotSeatBreakdown, :t},
      seat_management_setting:
        {:enum, ["assign_all", "assign_selected", "disabled", "unconfigured"]}
    ]
  end
end
