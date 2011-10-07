require "spec_helper"

describe SchoolfinderApi::Models::Schools do
  it "populates the data" do
    data = SchoolfinderApi::Models::Schools.new(get_xml('school_search.xml'))
    
    data.schools.count.should == 22
    
    data.schools[0].id.should == '99932'
    data.schools[0].name.should == 'St James Episcopal Day School'
    data.schools[0].address.should == '445 Convention St'
    data.schools[0].city.should == 'Baton Rouge'
    data.schools[0].state.should == 'LA'
    data.schools[0].zip.should == '70821'
    data.schools[0].phonenumber.should == '(225) 344-0805'
    data.schools[0].latitude.should == '30.4484863'
    data.schools[0].longitude.should == '-91.1863861'
    data.schools[0].districtid.should == '16566'
    data.schools[0].districtleaid.should == ""
    data.schools[0].aypresult.should == ""
    data.schools[0].aypresultyear.should == ""
    data.schools[0].distance.should == '0.68934968594462'
    data.schools[0].enrollment.should == '265'
    data.schools[0].gradelevel.should == 'Elementary'
    data.schools[0].gradesserved.should == 'PK, K-5'
    data.schools[0].schooldistrictname.should == 'LA Private Schools'
    data.schools[0].type.should == 'Private'
    data.schools[0].studentteacherratio.should == '10'
    data.schools[0].website.should == ""
    data.schools[0].ncesid.should == '00540942'
    data.schools[0].url.should == 'http://www.education.com/schoolfinder/us/louisiana/baton-rouge/st-james-episcopal-day-school/'
    data.schools[0].testratingtext.should == ""
    data.schools[0].testratingimagelarge.should == ""
    data.schools[0].testratingimagesmall.should == ""
    data.schools[0].testratingyear.should == ""
    
    data.schools[1].id.should == '74654'
  end
end