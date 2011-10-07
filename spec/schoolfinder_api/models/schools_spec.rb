require "spec_helper"

describe SchoolfinderApi::Models::Schools do
  it "populates the data" do
    data = SchoolfinderApi::Models::Schools.new(get_xml('school_search.xml'))
    
    data.schools.count.should == 22
    
    school = data.schools[0]
    school.id.should == '99932'
    school.name.should == 'St James Episcopal Day School'
    school.address.should == '445 Convention St'
    school.city.should == 'Baton Rouge'
    school.state.should == 'LA'
    school.zip.should == '70821'
    school.phonenumber.should == '(225) 344-0805'
    school.latitude.should == '30.4484863'
    school.longitude.should == '-91.1863861'
    school.districtid.should == '16566'
    school.districtleaid.should == ""
    school.aypresult.should == ""
    school.aypresultyear.should == ""
    school.distance.should == '0.68934968594462'
    school.enrollment.should == '265'
    school.gradelevel.should == 'Elementary'
    school.gradesserved.should == 'PK, K-5'
    school.schooldistrictname.should == 'LA Private Schools'
    school.type.should == 'Private'
    school.studentteacherratio.should == '10'
    school.website.should == ""
    school.ncesid.should == '00540942'
    school.url.should == 'http://www.education.com/schoolfinder/us/louisiana/baton-rouge/st-james-episcopal-day-school/'
    school.testratingtext.should == ""
    school.testratingimagelarge.should == ""
    school.testratingimagesmall.should == ""
    school.testratingyear.should == ""
  end
end