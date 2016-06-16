require 'spec_helper'

feature "add tag" do
  scenario "adding a new tag" do
    visit('links/new')
    fill_in :url, with: "https://www.apoorva.com"
    fill_in :title, with: "apoorva"
    fill_in :tags, with: "cats"
    click_button "Add New Link"
    expect(current_path).to eq "/links"

    within "ul#links" do
    link = Link.first
    p link.tags
    expect(link.tags.map(&:name)).to include('cats')
   end
  end

  scenario "adding multiple tags" do
    visit('links/new')
    fill_in :url, with: "https://www.apoorva.com"
    fill_in :title, with: "apoorva"
    fill_in :tags, with: "cats dogs"
    click_button "Add New Link"
    expect(current_path).to eq "/links"

    link = Link.first
    expect(link.tags.map(&:name)).to include('cats', 'dogs' )
  end
end