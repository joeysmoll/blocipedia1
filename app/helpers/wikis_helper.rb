module WikisHelper
    def user_is_authorized_to_delete?
        current_user && current_user.admin?
    end
    
    def user_is_authorized_to_create_private_post?
        current_user.premium? || current_user.admin?
    end
end
