class CollaboratorsController < ApplicationController
    def create
        wiki = Wiki.find(params[:wiki_id])
        user = User.find(params[:user_id])
        

        Collaborator.create(user_id: user.id, wiki_id: wiki.id)
            
        if Collaborator.create(user_id: user.id, wiki_id: wiki.id)
               flash[:notice] = "#{user.email} is now a collaborator."
        end
        redirect_to edit_wiki_path(wiki)
    end
    
    def destroy
        wiki = Wiki.find(params[:wiki_id])
        user = User.find(params[:user_id])
        
        if wiki.collaborating_users.destroy(user)
            flash[:notice] = "#{user.email} was removed successfully."
        else
            flash.now[:alert] = 'There was a problem removing the user.'
        end
        redirect_to edit_wiki_path(wiki)
    end
    
end
