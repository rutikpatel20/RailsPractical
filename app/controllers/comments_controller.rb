class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @comment = Comment.new(comment_params)
    @comment.event_id = @event.id
    if @comment.save
      flash[:errors] = "Comment Added Successfully"
      redirect_to event_path(@event)
    else
      flash[:errors] = @comment.errors.full_messages
    end
  end

  def edit
    @event = Event.find(params[:event_id])
  end
  
  def update
    @event = Event.find(params[:event_id])
    @comment = Comment.find(params[:comment_id])  
    if @comment.update(params.permit(:user_comment, :user_id)) 
      flash[:errors] = "Comment Added Successfully"
      redirect_to event_path(@event)
    else
      flash[:errors] = @comment.errors.full_messages
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @comment = Comment.find(params[:comment_id])
    if @comment.delete
      flash[:errors] = "Comment Deleted Successfully"
      redirect_to event_path(@event)
    else
      flash[:errors] = @comment.errors.full_messages
    end
  end

  def like
    @comment = Comment.find_by(id: params[:comment_id].to_i)
    @comment.like = @comment.like.to_i + 1
    @comment.update(like: @comment.like)
    @event = Event.find(params[:event_id])
    redirect_to event_path(@event)
  end

  private
  def comment_params
    params.require(:comment).permit(:user_comment, :user_id)
  end
end
