defmodule HttpClient.MockOAuth do
  @spec get_oauth_token() :: String.t()
  def get_oauth_token do
    "token"
  end
end
