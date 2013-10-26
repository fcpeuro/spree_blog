FactoryGirl.define do
  factory :author, class: Spree::Author do
    first_name "Eugenio"
    last_name "Montale"
    bio "Un autore italiano"

  end

  factory :tag, class: Spree::Tag do
    name "Mondiali Calcio"
    factory :tag_with_description do
      description "Tutto sui mondiali di calcio"
    end
  end

  factory :category, class: Spree::Category do
    name "Sport"
    factory :category_with_description do
      description "Tutto sullo sport"
    end
  end
end
