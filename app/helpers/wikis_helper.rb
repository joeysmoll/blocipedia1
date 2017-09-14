module WikisHelper
    def user_is_authorized_to_delete?
        current_user && current_user.admin?
    end
    
    def user_is_authorized_to_create_private_post?
        current_user.premium? || current_user.admin?
    end
    
    def markdown(text)
     extensions = {
       tables:                       true,
       fenced_code_blocks:           true,
       autolink:                     true,
       disable_indented_code_blocks: true,
       strikethrough:                true,
       superscript:                  true,
       underline:                    true,
       highlight:                    true,
       quote:                        true,
       footnotes:                    true
     }
 
     renderer = Redcarpet::Render::HTML
     markdown = Redcarpet::Markdown.new(renderer, extensions)
 
     markdown.render(text).html_safe
   end
end
