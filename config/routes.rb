Rails.application.routes.draw do
  # This route is for the bare domain. You can ignore it.
  get("/", { :controller => "game", :action => "home" })

  get("/play/:move", {:controller => "game", :action => "rps"})

end
