<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="booking.aspx.cs" Inherits="Restaurant.Restaurant.booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8"/>
    <title>Arabic Kitchen</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="" name="keywords"/>
    <meta content="" name="description"/>

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon"/>

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""/>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet"/>

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet"/>

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet"/>
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet"/>
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet"/>
</head>

<body runat="server">
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
                <a href="index.aspx" class="navbar-brand p-0">
                    <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>The New Arabic kitchen</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0 pe-4">
                        <a href="index.aspx" class="nav-item nav-link ">Home</a>
                        <a href="about.aspx" class="nav-item nav-link ">About</a>

                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle active " data-bs-toggle="dropdown">Menu</a>
                            <div class="dropdown-menu m-0">
                                <a href="menupage.aspx" class="dropdown-item">Food Menu</a>

                                <a href="booking.aspx" class="dropdown-item active">Table Pre-Booking</a>
                            </div>
                        </div>
                        <a href="contact.aspx" class="nav-item nav-link">Contact</a>
                    </div>
                    <a href="index.aspx" class="btn btn-primary py-2 px-4"> Back</a>
                </div>
            </nav>

            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Booking</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="index.aspx">Home</a></li>

                            <li class="breadcrumb-item text-white active" aria-current="page">Booking</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Reservation Start -->
        <div class="container-xxl py-5 px-0 wow fadeInUp" data-wow-delay="0.1s">
            <div class="row g-0">
                <div class="col-md-6">
                    <div class="video">
                        <button type="button" class="btn-play" data-bs-toggle="modal" data-src="https://www.youtube.com/embed/DWRcNpR6Kdc" data-bs-target="#videoModal">
                            <span></span>
                        </button>
                    </div>
                </div>
                <div class="col-md-6 bg-dark d-flex align-items-center">
                    <div class="p-5 wow fadeInUp" data-wow-delay="0.2s">
                        <h5 class="section-title ff-secondary text-start text-primary fw-normal">Reservation</h5>
                        <h1 class="text-white mb-4">Book A Table Online</h1>
                        <form runat="server" method="post">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <asp:TextBox ID="txt_name" runat="server" class="form-control" placeholder="Your Name" OnTextChanged="txt_name_TextChanged" required></asp:TextBox>
                                        <label for="name">Your Name</label>

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating">
                                        <asp:TextBox ID="txt_email" runat="server" class="form-control" placeholder="Your Email" OnTextChanged="txt_email_TextChanged" required></asp:TextBox>
                                        <label for="name">Your Email</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="name">*Pre-Booking Time:
                                        <br />
                                        10 AM to 9 PM only.</label>
                                    <div class="form-floating date" id="date3" data-target-input="nearest">
                                        <asp:TextBox ID="txt_datetime" runat="server" class="form-control datetimepicker-input" placeholder="Date & Time" data-target="#date3" data-toggle="datetimepicker" OnTextChanged="txt_datetime_TextChanged" required></asp:TextBox>
                                        <label for="name">Date Time</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="name"></label>
                                    <br />
                                    <br />
                                    <div class="form-floating">
                                        <asp:DropDownList ID="Select1" runat="server" class="form-select" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" required>
                                            <asp:ListItem>Guest 1</asp:ListItem>

                                            <asp:ListItem>Guests 2</asp:ListItem>

                                            <asp:ListItem>Guests 3</asp:ListItem>

                                            <asp:ListItem>Guests 4</asp:ListItem>

                                            <asp:ListItem>Guests 5</asp:ListItem>

                                            <asp:ListItem>Guests 6</asp:ListItem>
                                        </asp:DropDownList>


                                        <label for="name">Guests</label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <asp:TextBox ID="phone_txt" runat="server" class="form-control" placeholder="Phone +91 " OnTextChanged="txt_email_TextChanged" required></asp:TextBox>
                                        <label for="name">Phone +91</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating">
                                        <asp:TextBox ID="message_txt" class="form-control" runat="server" placeholder="Special Required" Style="height: 100px" name="message" OnTextChanged="message_txt_TextChanged"></asp:TextBox>
                                        <label for="name">Special Required</label>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <asp:Button ID="btn_Booking" runat="server" Text="Book Now" class="btn btn-primary w-100 py-3" OnClick="btn_Booking_Click" />

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="videoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Youtube Video</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                    </div>
                    <div class="modal-body">
                        <!-- 16:9 aspect ratio -->
                        <div class="ratio ratio-16x9">
                            <iframe class="embed-responsive-item" src="" id="video" allowfullscreen="" allowscriptaccess="always"
                                allow="autoplay"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Reservation Start -->


        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">The New Arabic Kitchen</h4>
                        <a class="btn btn-link" href="about.aspx">About Us</a>
                        <a class="btn btn-link" href="contact.aspx">Contact Us</a>

                        <a class="btn btn-link" href="#">Privacy Policy</a>
                        <a class="btn btn-link" href="#">Terms & Condition</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contact</h4>
                        <p class="mb-2">
                            <i class="fa fa-map-marker-alt me-3"></i>Arumpakkam, 
                    <br />
                            chennai - 600 009
                        </p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+91 92541 34521</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>arabickitchen@gmail.com.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href="#"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href="#"><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Opening</h4>
                        <h5 class="text-light fw-normal">Monday - Saturday</h5>
                        <p>09AM - 09PM</p>
                        <h5 class="text-light fw-normal">Sunday</h5>
                        <p>10AM - 08PM</p>
                    </div>
                    <div class="col-lg-3 col-md-6">

                        <div class="position-relative mx-auto" style="max-width: 400px;">

                            <a class="btn btn-primary py-3 px-5 mt-2" href="contact.aspx">Send Feedback</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="index.aspx">The New Arabic Kitchen</a>, All Right Reserved. 
			
			<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            Designed By <a class="border-bottom" href="#">VelanInfopark</a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="index.aspx">Home</a>
                                <a href="#">Cookies</a>
                                <a href="#">Help</a>
                                <a href="#">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>
