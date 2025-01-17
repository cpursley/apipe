defmodule Apipe.Error do
  defexception [:type, :message, :details]

  @type error_type ::
    :invalid_query |
    :execution_error |
    :provider_error |
    :validation_error

  @type t :: %__MODULE__{
    type: error_type(),
    message: String.t(),
    details: map() | nil
  }

  def message(%__MODULE__{message: message, details: nil}), do: message
  def message(%__MODULE__{message: message, details: details}), do: "#{message} - #{inspect(details)}"
end
