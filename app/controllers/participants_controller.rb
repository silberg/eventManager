class ParticipantsController < ApplicationController
  def index
    @participants = Participant.all
   end
   
   def new
    @participant = Participant.new
	@course = Course.all
   end
   
   def create  
     @course = Course.find_by_name(params[:name])
     @participant = Participant.new(params[:participant].permit(:first_name, :last_name, :email, :tlfnr)) 
	 @participant.save
	 @participant.overviews.new(participant_id: @participant.id, course_id: params[:course])
	 redirect_to @participant
   end
 
   def show
       @participant = Participant.find(params[:id])
	   @courses = @participant.courses()
   end
   def edit
       @participant = Participant.find(params[:id])
   end
   def update
       @participant = Participant.find(params[:id])
   end
end
