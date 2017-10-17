class MemoController < ApplicationController
    
    # Convention over Configuration (CoC)
    
    def index
        
        
    @msg = "記事一覧"
    @memos = Memo.all.order(created_at: 'asc')
        
    end
    
    def article
        redirect_to memo_article_url
        @msg = "記事一覧"
        
    end
    
    #表示
    
    def show
        @memo = Memo.find(params[:id])
    end
    
    #登録
    
    def new
        
        @memo = Memo.new
        
    end
    
    def create
        # render plain: params[:memo].inspect
        # @memo = Memo.new(params[:memo])
        @memo = Memo.new(memo_params)
        if @memo.save
            
        redirect_to memo_index_path
        
        else
            render 'new'
        end
    end
    
  #更新
    
    def edit
        
        @memo = Memo.find(params[:id])
       
    end
    
    def update
        @memo = Memo.find(params[:id])
        if @memo.update(memo_params)
            
        redirect_to memo_index_path
        
        else
            
        render 'edit' 
        
        end
    end
    
    def destroy
        @memo = Memo.find(params[:id])
        @memo.destroy
        redirect_to memo_index_path
    end
    
    #パラメータを当てはめる
    
    private
        def memo_params
            params.require(:memo).permit(:title, :body)
        end
    
end
