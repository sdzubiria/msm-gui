class DirectorsController < ApplicationController
  def update
    director = Director.find(params[:id])
    director.update({
      name: params[:query_name],
      dob: params[:query_dob],
      bio: params[:query_bio],
      image: params[:query_image]
    })
    redirect_to("/directors/#{director.id}")
  end
  
  def create
    director = Director.new({
      name: params.fetch("query_name"),
      dob: params.fetch("query_dob"),
      bio: params.fetch("query_bio"),
      image: params.fetch("query_image")
    })
  
    if director.save
      redirect_to("/directors")
    else
      redirect_to("/directors/new", { :alert => "Error creating director." })
    end
  end

 
  def destroy
    director = Director.find(params[:id])
    director.destroy
    redirect_to("/directors")
  end
  
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end

  
  
end
