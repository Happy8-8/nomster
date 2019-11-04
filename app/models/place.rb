class Place < ApplicationRecord
belongs_to :user
validates :name, presence: true, length: { minimum: 3, too_short: "is too short (minimum %{count} characters)" }
validates :address, presence: true, length: { in: 17..29 }
validates :description, presence: true, length: { maximum: 47, too_long: "%{count} characters is the maximum allowed" }
end

>> p = Name.new
# => #<Name id: nil, name: nil>
>> p.errors.messages
# => {}
 
>> p.valid?
# => false
>> p.errors.messages
# => {name:["can't be blank"]}
 
>> p = Name.create
# => #<Person id: nil, name: nil>
>> p.errors.messages
# => {name:["can't be blank"]}
 
>> p.save
# => false
 
>> p.save!
# => ActiveRecord::RecordInvalid: Validation failed: Name can't be blank
 
>> Name.create!
# => ActiveRecord::RecordInvalid: Validation failed: Name can't be blank

>> p1 = Address.new
# => #<Address id: nil, address: nil>
>> p1.errors.messages
# => {}
 
>> p1.valid?
# => false
>> p1.errors.messages
# => {address:["can't be blank"]}
 
>> p1 = Address.create
# => #<Address id: nil, address: nil>
>> p1.errors.messages
# => {address:["can't be blank"]}
 
>> p1.save
# => false
 
>> p1.save!
# => ActiveRecord::RecordInvalid: Validation failed: Address can't be blank
 
>> Address.create!
# => ActiveRecord::RecordInvalid: Validation failed: Address can't be blank

>> p2 = Description.new
# => #<Description id: nil, description: nil>
>> p2.errors.messages
# => {}
 
>> p2.valid?
# => false
>> p2.errors.messages
# => {description:["can't be blank"]}
 
>> p2 = Description.create
# => #<Description id: nil, description: nil>
>> p2.errors.messages
# => {description:["can't be blank"]}
 
>> p2.save
# => false
 
>> p2.save!
# => ActiveRecord::RecordInvalid: Validation failed: Description can't be blank
 
>> Description.create!
# => ActiveRecord::RecordInvalid: Validation failed: Description can't be blank

>> name = Name.new
>> name.valid?
>> name.errors.details[:name] # => [{error: :blank}]

>> address = Address.new
>> address.valid?
>> address.errors.details[:address] # => [{error: :blank}]

>> description = Description.new
>> description.valid?
>> description.errors.details[:description] # => [{error: :blank}]