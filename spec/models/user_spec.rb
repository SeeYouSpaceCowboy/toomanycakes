require 'rails_helper'

describe User do

  let(:patty) { User.create(name: "Patty",
                        password: '1234',
                         address: "10129",
                        fullname: "Patty Santa Cruz")}

  let(:cake) { Meal.create(name: "cake",
                   description: "So yummy",
                    expiration: (Date.today + 4),
                    img_url: "http://stuffpoint.com/cakes/image/189168-cakes-yummy-cake.jpg",
                    cook_id: patty.id) }

  let(:flatiron) {Group.create(name: "Flatiron School",
                        description: "Here we are.") }

  let(:david) { User.create(name: "David",
                        password: '1234',
                         address: "10075",
                        fullname: "David Weinstein")}



  it "can create an array of all the meal instances" do
    3.times { Portion.create(meal_id: cake.id, eater_id: david.id) }
    test = david.portions.first.meal_id
    expect(david.all_my_claimed_meals).to include test
  end
end
