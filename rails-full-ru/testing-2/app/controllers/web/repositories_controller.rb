# frozen_string_literal: true

# BEGIN
# END

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
    uri = URI.parse(permitted_params[:link])
    @repository = Repository.new(permitted_params)
    if @repository.valid?
      client = Octokit::Client.new
      _, owner, repo_name = uri.path.split('/')
      repo = client.repo name: repo_name, user: owner
      @repository.update(
        owner_name: repo[:owner][:login],
        repo_name: repo[:name],
        description: repo[:description],
        default_branch: repo[:default_branch],
        watchers_count: repo[:watchers_count],
        language: repo[:language],
        repo_created_at: repo[:created_at],
        repo_updated_at: repo[:updated_at]
      )
      redirect_to repositories_path
    else
      render :new, status: :unprocessable_entity
    end
    # END
  end

  def edit
    @repository = Repository.find params[:id]
  end

  def update
    @repository = Repository.find params[:id]

    if @repository.update(permitted_params)
      redirect_to repositories_path, notice: t('success')
    else
      flash[:notice] = t('fail')
      render :edit, status: :unprocessable_entity
    end
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
