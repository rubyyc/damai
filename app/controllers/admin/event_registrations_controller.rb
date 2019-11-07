   class Admin::EventRegistrationsController < AdminController

     before_action :find_event

     def index
         # @registrations = @event.registrations.includes(:ticket).order("id DESC")
         @registrations = @event.registrations.includes(:ticket).order("id DESC").page(params[:page]).per(20)
       end

     def destroy
         @registration = @event.registrations.find_by_uuid(params[:id])
         @registration.destroy

         redirect_to admin_event_registrations_path(@event)
       end

     protected

     def find_event
         @event = Event.find(params[:event_id])
       end

     def registration_params
         params.require(:registration).permit(:status, :ticket_id, :name, :email, :cellphone, :website, :bio)
       end

end
