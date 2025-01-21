defmodule GitHubOpenAPI.GpgKey do
  @moduledoc """
  Provides struct and type for a GpgKey
  """
  use Apipe.Providers.OpenAPIEncoder

  @type t :: %__MODULE__{
          __info__: map,
          __joins__: map,
          can_certify: boolean,
          can_encrypt_comms: boolean,
          can_encrypt_storage: boolean,
          can_sign: boolean,
          created_at: DateTime.t(),
          emails: [GitHubOpenAPI.GpgKeyEmails.t()],
          expires_at: DateTime.t() | nil,
          id: integer,
          key_id: String.t(),
          name: String.t() | nil,
          primary_key_id: integer | nil,
          public_key: String.t(),
          raw_key: String.t() | nil,
          revoked: boolean,
          subkeys: [GitHubOpenAPI.GpgKeySubkeys.t()]
        }

  defstruct [
    :__info__,
    :__joins__,
    :can_certify,
    :can_encrypt_comms,
    :can_encrypt_storage,
    :can_sign,
    :created_at,
    :emails,
    :expires_at,
    :id,
    :key_id,
    :name,
    :primary_key_id,
    :public_key,
    :raw_key,
    :revoked,
    :subkeys
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      can_certify: :boolean,
      can_encrypt_comms: :boolean,
      can_encrypt_storage: :boolean,
      can_sign: :boolean,
      created_at: {:string, :date_time},
      emails: [{GitHubOpenAPI.GpgKeyEmails, :t}],
      expires_at: {:union, [{:string, :date_time}, :null]},
      id: :integer,
      key_id: {:string, :generic},
      name: {:union, [{:string, :generic}, :null]},
      primary_key_id: {:union, [:integer, :null]},
      public_key: {:string, :generic},
      raw_key: {:union, [{:string, :generic}, :null]},
      revoked: :boolean,
      subkeys: [{GitHubOpenAPI.GpgKeySubkeys, :t}]
    ]
  end
end
