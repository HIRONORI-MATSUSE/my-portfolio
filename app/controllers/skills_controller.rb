class SkillsController < ApplicationController
  def index
    @back = Category.find_by(name:"バックエンド")
    @front = Category.find_by(name:"フロントエンド")
    @infra = Category.find_by(name:"インフラ")
  end
  
  def new
    @skill = Skill.new
    category = params[:category]
    if category == "backend"
      @category = Category.find_by(name: "バックエンド")
    elsif category == "frontend"
      @category = Category.find_by(name:"フロントエンド")
    else
      @category = Category.find_by(name:"インフラ")
    end
  end
  
  def create
    @skill = current_user.skills.new(skill_params)
    console
    if @skill.save
      redirect_to skills_path, notice: "スキル登録（モーダル）"
    else
      render :new
    end
  end

  def edit
    # バックエンドのskillを表示させたい。
    @backend = Skill.find(params[:id])
  end

  def update
      task = Task.find(params[:id])
      if @skill.update!(skill_params)
        redirect_to skills_path, notice: "スキル更新（モーダル）"
      else
        render skills_path, notice: "失敗"
      end
  end
  
  def destroy
    skill = Skill.find(params[:id])
    if skill.destroy
      redirect_to skills_path, notice: "スキル削除しました。(モーダル)"
    else
      redirect_to skills_path, notice: "失敗"
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :proficiency_level, :category_id).merge(user_id: current_user.id)
  end
end
