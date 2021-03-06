FactoryGirl.define do
  factory :showback_event, :class => ManageIQ::Consumption::ShowbackEvent do
    association :resource, :factory => :vm
    start_time                4.hours.ago
    end_time                  1.hour.ago
    context                   { { } }
    data                      { { } }

    trait :with_tags_in_context do
      context { { "tag"=>{"environment"=>["test"] } } }
    end

    #trait :with_several_tags_in_context do

    trait :with_vm_data do
      data { {"CPU"=>{"average"=>[29.8571428571429, "percent"], "number"=>[2.0, "cores"], "max_number_of_cpu"=>[2, "cores"]}, "MEM"=>{"max_mem"=>[2048, "Mib"]}, "FLAVOR"=>{}} }
    end

    trait :full_month do
      start_time  DateTime.now.utc.beginning_of_month
      end_time    DateTime.now.utc.end_of_month
    end

    trait :first_half_month do
      start_time     DateTime.now.utc.beginning_of_month
      end_time       DateTime.now.utc.change(:day => 15).end_of_day
    end
  end
end
