class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  actor = Actor.new({
    name: params.fetch("query_name"),
    dob: params.fetch("query_dob"),
    bio: params.fetch("query_bio"),
    image: params.fetch("query_image")
  })

  if actor.save
    redirect_to("/actors")
  else
    redirect_to("/actors/new", { :alert => "Error creating actor." })
  end
end

def update
  the_id = params.fetch("path_id")
  actor = Actor.where({ :id => the_id }).first

  actor.name = params.fetch("query_name", actor.name)
  actor.dob = params.fetch("query_dob", actor.dob)
  actor.bio = params.fetch("query_bio", actor.bio)
  actor.image = params.fetch("query_image", actor.image)

  if actor.save
    redirect_to("/actors/#{the_id}")
  else
    redirect_to("/actors/#{the_id}/edit", { :alert => "Error updating actor." })
  end
end

def destroy
  the_id = params.fetch("path_id")
  actor = Actor.where({ :id => the_id }).first

  actor.destroy

  redirect_to("/actors")
end

end
