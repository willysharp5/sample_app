require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home Page at '/'" do
    get '/'
    response.should have_selector('title', :content => "home")
  end
  
  it "should have a Contact Page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "contact")
  end
  
  it "should have a About Page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "about")
  end
  
  it "should have a Help Page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "help")
  end
  
  it "should have a help page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign Up")
  end
  
  it "should have a the right links on the layout" do
    visit root_path
    response.should have_selector('title', :content => "home")
    click_link "About"
    response.should have_selector('title', :content => "about")
    click_link "Contact"
    response.should have_selector('title', :content => "contact")
    click_link "Home"
    response.should have_selector('title', :content => "home")
    click_link "Sign up now!"
    response.should have_selector('title', :content => "Sign up")
    response.should have_selector('a[href="/"]>img')
  end

end
