module Mutations
    class EditPost < BaseMutation
        argument :id, ID, required: true
        argument :title, String
        argument :body, String
        
        field :post, Types::PostType

        def resolve(**params)
            post = Post.find_by(id: params[:id])
            Pundit.authorize(context[:current_user], post, :update?)
            
            { post: post, errors: [] }
        end

        def update_params(params)
            params.slice(:title, :body, :id)
        end
    end
end