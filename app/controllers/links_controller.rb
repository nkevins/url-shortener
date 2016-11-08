class LinksController < ApplicationController
    
    def new
       @link = Link.new
       @links = Link.all
    end
    
    def create
        @link = Link.new(link_params)
        @link.shortened = Link.new_shortened_url
        @link.save
        redirect_to :controller => 'links', :action => 'new'
    end
    
    def resolve
        link = Link.find_by(shortened: params[:id])
        url = link.original
        url = "http://#{url}" unless url=~/^https?:\/\//
        redirect_to url
        link.hit += 1
        link.save
    end
    
    private
        def link_params
           params.require(:link).permit(:original) 
        end
end
