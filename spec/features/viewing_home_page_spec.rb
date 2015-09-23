
feature 'viewing home page' do

scenario 'can view homepage' do
  visit '/'
  expect(page).to have_content("Welcome")
end

end
