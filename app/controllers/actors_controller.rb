class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all.order(created_at: :desc)
    render({ :template => "actor_templates/index" })
  end

  def show
    @the_actor = Actor.find(params.fetch("path_id"))
    render({ :template => "actor_templates/show" })
  end

  def create
    actor = Actor.new({
      name: params.fetch("query_name"),
      dob: params.fetch("query_dob"),
      bio: params.fetch("query_bio"),
      image: params.fetch("query_image")
    })

    if actor.save
      redirect_to("/actors")
    else
      redirect_to("/actors/new", { alert: "Error creating actor." })
    end
  end

  def update
    actor = Actor.find(params.fetch("path_id"))
    actor.assign_attributes({
      name: params.fetch("query_name"),
      dob: params.fetch("query_dob"),
      bio: params.fetch("query_bio"),
      image: params.fetch("query_image")
    })

    if actor.save
      redirect_to("/actors/#{actor.id}")
    else
      redirect_to("/actors/#{actor.id}/edit", { alert: "Error updating actor." })
    end
  end

  def destroy
    actor = Actor.find(params.fetch("path_id"))
    actor.destroy
    redirect_to("/actors")
  end
end
