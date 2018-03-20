states = Array[ ["AK", "Alaska"], 
                ["AL", "Alabama"], 
                ["AR", "Arkansas"], 
                ["AS", "American Samoa"], 
                ["AZ", "Arizona"], 
                ["CA", "California"], 
                ["CO", "Colorado"], 
                ["CT", "Connecticut"], 
                ["DC", "District of Columbia"], 
                ["DE", "Delaware"], 
                ["FL", "Florida"], 
                ["GA", "Georgia"], 
                ["GU", "Guam"], 
                ["HI", "Hawaii"], 
                ["IA", "Iowa"], 
                ["ID", "Idaho"], 
                ["IL", "Illinois"], 
                ["IN", "Indiana"], 
                ["KS", "Kansas"], 
                ["KY", "Kentucky"], 
                ["LA", "Louisiana"], 
                ["MA", "Massachusetts"], 
                ["MD", "Maryland"], 
                ["ME", "Maine"], 
                ["MI", "Michigan"], 
                ["MN", "Minnesota"], 
                ["MO", "Missouri"], 
                ["MS", "Mississippi"], 
                ["MT", "Montana"], 
                ["NC", "North Carolina"], 
                ["ND", "North Dakota"], 
                ["NE", "Nebraska"], 
                ["NH", "New Hampshire"], 
                ["NJ", "New Jersey"], 
                ["NM", "New Mexico"], 
                ["NV", "Nevada"], 
                ["NY", "New York"], 
                ["OH", "Ohio"], 
                ["OK", "Oklahoma"], 
                ["OR", "Oregon"], 
                ["PA", "Pennsylvania"], 
                ["PR", "Puerto Rico"], 
                ["RI", "Rhode Island"], 
                ["SC", "South Carolina"], 
                ["SD", "South Dakota"], 
                ["TN", "Tennessee"], 
                ["TX", "Texas"], 
                ["UT", "Utah"], 
                ["VA", "Virginia"], 
                ["VI", "Virgin Islands"], 
                ["VT", "Vermont"], 
                ["WA", "Washington"], 
                ["WI", "Wisconsin"], 
                ["WV", "West Virginia"], 
                ["WY", "Wyoming"],
                ["MP", "Northern Mariana Islands"] ]

states.each do |state_ary|
  State.find_or_create_by(code: state_ary[0], name: state_ary[1])
end

repo = Git.open(Rails.root.join('congress-legislators'))
repo.pull

legislators = YAML.load(File.open(Rails.root.join('congress-legislators', 'legislators-current.yaml')))
legislators.each do |legislator|
  l = Legislator.find_or_create_by(thomas_id: legislator['id']['thomas'])
  l.update({
    first_name: legislator['name']['first'],
    last_name: legislator['name']['last'],
    middle_name: legislator['name']['middle'],
    birthday: legislator['bio']['birthday'],
    gender: legislator['bio']['gender'],
    official_name: legislator['name']['official_full'],
    wikipedia: legislator['id']['wikipedia']
  })
  
  legislator['terms'].each do |term|
    Term.find_or_create_by(legislator_id: l.id, start_date: Date.parse(term['start']))
      .update({
        end_date: Date.parse(term['end']),
        state_id: State.find_by(code: term['state']).id,
        party_id: Party.find_or_create_by(name: term['party']).id,
        district: term['district'],
        url: term['url'],
        address: term['address'],
        phone: term['phone'],
        fax: term['fax']
      })
  end
end

social_media_accounts = YAML.load(File.open(Rails.root.join('congress-legislators', 'legislators-social-media.yaml')))


social_media_accounts.each do |social|
  l = Legislator.find_by(thomas_id: social['id']['thomas'])

  if l.present?
    l.update({
      twitter: social['social']['twitter'],
      facebook: social['social']['facebook'],
      youtube: social['social']['youtube_id'],
      instagram: social['social']['instagram']
    })
  end
end