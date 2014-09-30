class AttachmentsController < ApplicationController
  def index
    @attachments = Attachment.all
    @main_attachment = Attachment.where(main: true).last
  end

  def new
    @attachment = Attachment.new
  end

  def all
    @attachments = Attachment.all
  end

  def create
    if params[:attachment]
      valid = true
      attachments = []
      params[:attachment][:file].each do |a|
        attach = Attachment.new(file: a)
        attach.valid? ? attachments << attach : valid = false
      end
    else
      valid = false
    end

    if valid
      attachments.each {|a| a.main = true if Attachment.count == 0; a.save}
      flash[:notice] = "Успешно создано"
      redirect_to root_path
    else
      flash[:error] = "Ошибка! Вы загружаете не фотографию, либо размер превышает 25мб."
      redirect_to new_attachment_path
    end
  end
end
