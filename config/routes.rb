Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  post("/insert_director", { :controller => "directors", :action => "create" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/modify_director_record/:id", { :controller => "directors", :action => "update" })
  get("/delete_director/:id", { :controller => "directors", :action => "destroy" })

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/insert_movie_record", { :controller => "movies", :action => "create" })
  get("/delete_movie/:an_id", { :controller => "movies", :action => "destroy" })
  post("/modify_movie_record/:the_id", { :controller => "movies", :action => "update" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  post("/insert_actor", { :controller => "actors", :action => "create" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/modify_actor_record/:the_id", { :controller => "actors", :action => "update" })
  get("/delete_actor/:an_id", { :controller => "actors", :action => "destroy" })
end
