describe 'user visits comdedians page' do
  it 'sees name and age' do
    comedian1 = Comedian.create(name: "Joe", age: 30)
    comedian2 = Comedian.create(name: "Lisa", age: 31)
    visit "/comedians"

    expect(page).to have_content "#{comedian1.name}"
    expect(page).to have_content "#{comedian1.age}"
    expect(page).to have_content "#{comedian2.name}"
    expect(page).to have_content "#{comedian2.age}"
  end

  it 'sees comedians specials' do
    comedian1= Comedian.create(name: "Joe", age: 30)
    special1= Special.create(name: "Comedy Special", comedian_id: 1)

    visit "/comedians"

    expect(page).to have_content "#{special1.name}"
  end

  it 'sees comedians average age' do
    comedian1 = Comedian.create(name: "Joe", age: 30)
    comedian2 = Comedian.create(name: "Lisa", age: 60)

    visit '/comedians'

    expect(page).to have_content("Average Age: 30")
  end
end
