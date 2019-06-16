abstract class BrowserAction < Lucky::Action
  include Lucky::ProtectFromForgery
  include Lucky::BasicAuthPipe
end
