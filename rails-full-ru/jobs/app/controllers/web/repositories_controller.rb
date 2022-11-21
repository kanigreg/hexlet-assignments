# frozen_string_literal: true

class Web::RepositoriesController < Web::ApplicationController
  def index
    @repositories = Repository.all
  end

  def new
    @repository = Repository.new
  end

  def show
    @repository = Repository.find params[:id]
  end

  def create
    # BEGIN
    @repository = Repository.new(permitted_params)

    if @repository.save
      RepositoryLoaderJob.perform_later(@repository.id)
      redirect_to repository_path(@repository), notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
    # END
  end

  def update
    # BEGIN
    RepositoryLoaderJob.perform_later(params[:id])

    redirect_to repositories_path
    # END
  end

  def update_repos
    # BEGIN
    Repository.find_each do |repo|
      RepositoryLoaderJob.perform_later(repo.id)
    end

    redirect_to repositories_path
    # END
  end

  def destroy
    @repository = Repository.find params[:id]

    if @repository.destroy
      redirect_to repositories_path, notice: t('success')
    else
      redirect_to repositories_path, notice: t('fail')
    end
  end

  private

  def permitted_params
    params.require(:repository).permit(:link)
  end
end
