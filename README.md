# Procore

[![CircleCI](https://circleci.com/gh/procore/elixir-sdk.svg?style=svg&circle-token=c727e644564c7d196c3c369ae9dcc747adb3ef19)](https://circleci.com/gh/procore/elixir-sdk)

A wrapper around Procore's API. Currently in progress with new resources being
added everyday!

## Installation

Add the following code to your dependencies in your **`mix.exs`** file:

```elixir
{:procore, "~> 1.0.0"}
```

## Configuration

In one of your configuration files, include your Procore client_id and
client_secret key like this:

```elixir
config :procore,
  client_id: "PROCORE_CLIENT_ID",
  client_secret: "PROCORE_CLIENT_SECRET"
  host: "PROCORE_HOST_URL"
  oauth_url: "#{PROCORE_HOST_URL}/oauth/token",
  http_client: Procore.HttpClient,
  default_version: "v1.0"
```

`default_version` sets the default API version to use if none is specified in the client request. Should be either "v1.0" (recommended) or "vapid" (legacy).

Add `:procore` to your list of applications if using Elixir 1.3 or lower.

```elixir
defp application do
  [applications: [:procore]]
end
```


### Examples

```elixir
alias Procore.Resources.Offices

client = Procore.client()

{:ok, response} = client |> Offices.list(%{"company_id" => 1, "api_version" => "v1.1"})

#=> response
%ResponseResult{
  status_code: 200,
  parsed_body: [%{
    "address" => "6309 Carpinteria Ave.",
    "city" => "Carpinteria",
    "country_code" => "US",
    "division" => nil,
    "fax" => "5555555555",
    "id" => 1,
    "name" => "Carpinteria Office",
    "phone" => "5555555555",
    "state_code" => "CA",
    "zip" => "93013"
  }],
  reply: :ok
}
```

## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).

## About Procore

<img
  src="https://www.procore.com/images/procore_logo.png"
  alt="Procore Logo"
  width="250px"
/>

The Procore Hex package is maintained by Procore Technologies.

Procore - building the software that builds the world.

Learn more about the #1 most widely used construction management software at
[procore.com](https://www.procore.com/)
