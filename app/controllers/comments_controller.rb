class CommentsController < ApplicationController
 authorize_resource

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.commentable, notice: 'Comment was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.js { render "error" }
      end
    end
  end



  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable    
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @commentable, notice: "Comment removed" }
      format.js
    end
  end
end
