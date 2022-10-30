module Mutations
    class CreatePost < BaseMutation
        argument :title, String, required: true
        argument :body, String, required: true
        
        field :post, Types::PostType

        def resolve(title:, body:)
            post = Post.new(title: title, body: body)
            post.user = context[:current_user]

            if post.save
                { post: post, errors: [] }
            else
                { post: {}, errors: ['Invalid input']}
            end
        end

    end
end