// CSIRO has filed various patents which cover the Software. 

// CSIRO grants to you a license to any patents granted for inventions
// implemented by the Software for academic, research and non-commercial
// use only.

// CSIRO hereby reserves all rights to its inventions implemented by the
// Software and any patents subsequently granted for those inventions
// that are not expressly granted to you.  Should you wish to license the
// patents relating to the Software for commercial use please contact
// CSIRO IP & Licensing, Gautam Tendulkar (gautam.tendulkar@csiro.au) or
// Nick Marsh (nick.marsh@csiro.au)

// This software is provided under the CSIRO OPEN SOURCE LICENSE
// (GPL2) which can be found in the LICENSE file located in the top
// most directory of the source code.

// Copyright CSIRO 2013

#include "utils/helpers.hpp"
#include "utils/command-line-arguments.hpp"
#include "utils/points.hpp"
#include "tracker/FaceTracker.hpp"
#include <opencv2/highgui/highgui.hpp>
#include <string>
#include <sstream> 
#include <iostream>
#include <math.h>
using namespace FACETRACKER;
 
struct Configuration
{
  double wait_time;
  std::string model_pathname;
  std::string params_pathname;
  int tracking_threshold;
  std::string window_title;
  bool verbose;
  bool save_3d_points;

  int circle_radius;
  int circle_thickness;
  int circle_linetype;
  int circle_shift;
};


int detect_face(std::string name);
double distance(cv::Point2d a, cv::Point2d b);
double score(const std::vector<cv::Point_<double> >& data);
cv::Mat compute_pose_image(const Pose &pose, int height, int width);
void display_data(const Configuration &cfg,
       const cv::Mat &image,
       const std::vector<cv::Point_<double> > &points,
       const Pose &pose,
       const std::string name); 

 

int main(int argc, char **argv)
{ 
    // Configuration cfg;
    //    cfg.wait_time = 0;
    //   cfg.model_pathname = DefaultFaceTrackerModelPathname();
    //   cfg.params_pathname = DefaultFaceTrackerParamsPathname();
    //   cfg.tracking_threshold = 5;
    //   cfg.window_title = "Face Landmark";
    //   cfg.verbose = false;
    //   cfg.circle_radius = 3;
    //   cfg.circle_thickness = 2;
    //   cfg.circle_linetype = 8;
    //   cfg.circle_shift = 0;  
    //   cfg.save_3d_points = false; 

    // detect_face(cfg,"bb.jpg");

  std::cout<<detect_face("bb.jpg")<<std::endl;

  return 0;
} 




int detect_face(std::string name)
{  
    Configuration cfg;
    cfg.wait_time = 0;
    cfg.model_pathname = DefaultFaceTrackerModelPathname();
    cfg.params_pathname = DefaultFaceTrackerParamsPathname();
    std::cout<<cfg.model_pathname<<" "<<cfg.params_pathname<<std::endl;
    
    cfg.tracking_threshold = 5;
    cfg.window_title = "Face Landmark";
    cfg.verbose = false;
    cfg.circle_radius = 3;
    cfg.circle_thickness = 2;
    cfg.circle_linetype = 8;
    cfg.circle_shift = 0;  
    cfg.save_3d_points = false; 

    FaceTracker * tracker = LoadFaceTracker(cfg.model_pathname.c_str());
    FaceTrackerParams *tracker_params  = LoadFaceTrackerParams(cfg.params_pathname.c_str());

    cv::Mat image;
    cv::Mat_<uint8_t> gray_image = load_grayscale_image(name.c_str(), &image);

    int result = tracker->NewFrame(gray_image, tracker_params);

    std::vector<cv::Point_<double> > shape;
    std::vector<cv::Point3_<double> > shape3;
    Pose pose;
    
    if (result >= cfg.tracking_threshold) 
    {
      shape = tracker->getShape();
      shape3 = tracker->get3DShape();
      pose = tracker->getPose();
    }

 
    int i=0;
    for(std::vector<cv::Point_<double> >::iterator iter=shape.begin();iter!=shape.end();iter++)
    {
      cv::Point_<double> point=*iter;
      std::cout<<i++<<" : "<<point.x<<","<<point.y<<std::endl;
    }

    result=score(shape);
    std::cout<<"score: "<<result<<std::endl;
    std::string path(name.c_str());
    std::string save_name=path.substr(0,path.find('.'));
    save_name+="2.jpg"; 
    display_data(cfg, image, shape, pose, save_name); 

 
 
    delete tracker;
    delete tracker_params; 
    
    return result;
}

 
void display_data(const Configuration &cfg,
	     const cv::Mat &image,
	     const std::vector<cv::Point_<double> > &points,
	     const Pose &pose,
       const std::string name)
{

  cv::Scalar colour;
  if (image.type() == cv::DataType<uint8_t>::type)
    colour = cv::Scalar(255);
  else if (image.type() == cv::DataType<cv::Vec<uint8_t,3> >::type)
    colour = cv::Scalar(0,0,255);
  else
    colour = cv::Scalar(255);

  cv::Mat displayed_image;
  if (image.type() == cv::DataType<cv::Vec<uint8_t,3> >::type)
    displayed_image = image.clone();
  else if (image.type() == cv::DataType<uint8_t>::type)
    cv::cvtColor(image, displayed_image, CV_GRAY2BGR);
  else 
    throw make_runtime_error("Unsupported camera image type for display_data function.");

  for (size_t i = 0; i < points.size(); i++) 
  { 
    std::string index;
    std::stringstream ss;
    ss<<i;
    ss>>index;

    cv::circle(displayed_image, points[i], cfg.circle_radius, colour, cfg.circle_thickness, cfg.circle_linetype, cfg.circle_shift);
    cv::putText(displayed_image,index,points[i],1,1,colour,1);
  }

  int pose_image_height = 100;
  int pose_image_width = 100;
  cv::Mat pose_image = compute_pose_image(pose, pose_image_height, pose_image_width);
  for (int i = 0; i < pose_image_height; i++) {
    for (int j = 0; j < pose_image_width; j++) {
      displayed_image.at<cv::Vec<uint8_t,3> >(displayed_image.rows - pose_image_height + i,
					      displayed_image.cols - pose_image_width + j)
			 
			 = pose_image.at<cv::Vec<uint8_t,3> >(i,j);
    }
  }

  cv::imshow(cfg.window_title, displayed_image);
  cv::imwrite(name,displayed_image);  
  std::cout<<"saved to : "<<name<<std::endl;

  if (cfg.wait_time == 0)
    std::cout << "Press any key to continue." << std::endl;

  char ch = cv::waitKey(cfg.wait_time * 1000);

  if (ch == 27)
  {
    cv::destroyAllWindows();
  }
    
}

cv::Mat compute_pose_image(const Pose &pose, int height, int width)
{
  cv::Mat_<cv::Vec<uint8_t,3> > rv = cv::Mat_<cv::Vec<uint8_t,3> >::zeros(height,width);
  cv::Mat_<double> axes = pose_axes(pose);
  cv::Mat_<double> scaling = cv::Mat_<double>::eye(3,3);

  for (int i = 0; i < axes.cols; i++) {
    axes(0,i) = -0.5*double(width)*(axes(0,i) - 1);
    axes(1,i) = -0.5*double(height)*(axes(1,i) - 1);
  }
  
  cv::Point centre(width/2, height/2);
  // pitch
  cv::line(rv, centre, cv::Point(axes(0,0), axes(1,0)), cv::Scalar(255,0,0));
  // yaw
  cv::line(rv, centre, cv::Point(axes(0,1), axes(1,1)), cv::Scalar(0,255,0));
  // roll
  cv::line(rv, centre, cv::Point(axes(0,2), axes(1,2)), cv::Scalar(0,0,255));

  return rv;
}

double distance(cv::Point2d a, cv::Point2d b)
{
  return sqrt(pow(a.x-b.x,2)+pow(a.y-b.y,2));
}

double score(const std::vector<cv::Point_<double> >& data)
{ 
  cv::Point_<double> left_eyebrow_right_corner=data[21];
  cv::Point_<double> right_eyebrow_left_corner=data[22];
  cv::Point_<double> nose_contour_lower_middle=data[33];
  cv::Point_<double> left_eye_right_corner=data[39];
  cv::Point_<double> right_eye_left_corner=data[42];
  cv::Point_<double> nose_left=data[31];
  cv::Point_<double> nose_right=data[35];
  cv::Point_<double> face_contour_left=data[1]; //??
  cv::Point_<double> face_contour_right=data[15];
  cv::Point_<double> chin_coutour=data[8];  //??
  cv::Point_<double> left_eye_left_corner=data[36];
  cv::Point_<double> right_eye_right_corner=data[45];
  cv::Point_<double> mouth_left_corner=data[48];
  cv::Point_<double> mouth_right_corner=data[54];

  //计算两眉头间的距离
  double c1=distance(left_eyebrow_right_corner,right_eyebrow_left_corner);
  std::cout<<"left_eyebrow_right_corner,right_eyebrow_left_corner "<<c1<<std::endl;
  //眉毛之间的中点坐标;
  cv::Point_<double> c1pos( (left_eyebrow_right_corner.x+right_eyebrow_left_corner.x)/2,
              (left_eyebrow_right_corner.y+right_eyebrow_left_corner.y)/2 );

  //眉毛中点到鼻子最低处的距离
  double c2 = distance(nose_contour_lower_middle,c1pos);
  std::cout<<"nose_contour_lower_middle,c1pos "<<c2<<std::endl;

  //眼角之间的距离 
  double c3 = distance(left_eye_right_corner,right_eye_left_corner);
  std::cout<<"left_eye_right_corner,right_eye_left_corner "<<c3<<std::endl;

  //鼻子的宽度
  double c4 = distance(nose_left,nose_right);
  std::cout<<"nose_left,nose_right"<<c4<<std::endl;

  //脸的宽度
  double c5 = distance(face_contour_left,face_contour_right);
  std::cout<<"face_contour_left,face_contour_right "<<c5<<std::endl;
  //下巴到鼻子下方的高度
  double c6 = distance(chin_coutour,nose_contour_lower_middle);
  std::cout<<"chin_coutour,nose_contour_lower_middle "<<c6<<std::endl;

  //眼睛的大小
  double c7_left = distance(left_eye_left_corner,left_eye_right_corner);
  double c7_right = distance(right_eye_left_corner,right_eye_right_corner);
  std::cout<<"left right eye size "<<c7_left<<" "<<c7_right<<std::endl;

  //嘴巴的大小
  double c8 = distance(mouth_left_corner,mouth_right_corner);
  c8*=0.9;
  std::cout<<"mouth size "<<c8<<std::endl;

  //嘴巴处的face大小
  double c9 = distance(data[5],data[11]);
  std::cout<<"face on mouth "<<c9<<std::endl;

  /* 开始计算步骤 */
  double yourmark = 100,mustm = 0;
  std::cout<<"-------------------------------------------"<<std::endl;
  //眼角距离为脸宽的1/5，
  mustm += abs((c3/c5)*100 - 25);
  std::cout<<"eye distance per face "<<abs((c3/c5)*100 - 25)<<std::endl;
  //鼻子宽度为脸宽的1/5
  double c55=distance(data[5],data[12]);
  mustm += abs((c4/c55)*100 - 25);
  std::cout<<"nose width per face "<<c55<<"-"<<abs((c4/c55)*100 - 25)<<std::endl;

  //眼睛的宽度，应为同一水平脸部宽度的!/5
  double eyepj = (c7_left+c7_right)/1.5;
  mustm += abs(eyepj/distance(data[0],data[16])*100 - 25);
  std::cout<<"eye width per face "<<distance(data[0],data[16])<<":"<<eyepj<<" "<<abs(eyepj/c5*100 - 25)<<std::endl;

  //理想嘴巴宽度应为同一脸部宽度的1/2
  mustm += abs((c8/c9)*100 - 50);
  std::cout<<"mouth width per face "<<abs((c8/c9)*100 - 50)<<std::endl;

  //下巴到鼻子下方的高度 == 眉毛中点到鼻子最低处的距离
  mustm += abs(c6 - c2)/10;
  std::cout<<"chin to nose versus middle of eyebrow to nose "<<abs(c6 - c2)/10<<std::endl;

  double smile=0;
  double score = yourmark - mustm + smile;  

  return score;       
}