class EntriesController < ApplicationController
  def new
    # find a Place
    @place = Place.find_by({ "id" => params["place_id"] })
    # render entries/new view
  end

  def create
    # start with a new Entry
    @entry = Entry.new

    # assign user-entered form data
    @entry["place_id"] = params["place_id"]
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]

    # save Entry row
    @entry.save

    # redirect user back to the place page
    redirect_to "/places/#{@entry["place_id"]}"
  end
end
