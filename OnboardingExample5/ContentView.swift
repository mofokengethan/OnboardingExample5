//
//  ContentView.swift
//  OnboardingExample5
//
//  Created by Ethan Mofokeng on 12/19/22.
//

import SwiftUI

extension Color {
    static let lightBlue = Color(red: 198/255, green: 224/255, blue: 255/255)
    static let lightPurple = Color(red: 216/255, green: 206/255, blue: 255/255)
    static let lightBrown = Color(red: 240/255, green: 217/255, blue: 202/255)
}

struct ContentView: View {
    @State var onboardingProgress =  0
    
    var body: some View {
        VStack {
            switch onboardingProgress {
                case 0:
                    OnboardingView(
                        onboardingProgress: $onboardingProgress,
                        image: "image1",
                        title: "Use shapes to decorate your designs",
                        description: "Decorate your design products with relevant shapes. Use basic geometric shapes like square, circles or more complex shapes such as hearts, starts, bubbles to draw attention to your design segments!",
                        color: Color.lightPurple,
                        nextButton: { onboardingProgress = 1})
                case 1:
                    OnboardingView(
                        onboardingProgress: $onboardingProgress,
                        image: "image2",
                        title: "Combine shapes with other objects",
                        description: "Use arrows, lines, and illustrations to make unique visuals every time. Shapes may look simplistic and even basic, but they're a great addition to your designs. Don't get carried away, though! Too many shapes can overcomplicate your design.",
                        color: Color.lightBlue,
                        nextButton: { onboardingProgress = 2 })
                case 2:
                    OnboardingView(
                        onboardingProgress: $onboardingProgress,
                        image: "image3",
                        title: "Animate shapes to catch the attention",
                        description: "Geometricc makes it very easy to animate any design object. There are animation presets that allow you to make a shape zoom, fade, wobble, shake, spin and more, with just a click of a button.",
                        color: Color.lightBrown,
                        nextButton: { onboardingProgress = 2})
                default:
                    EmptyView()
            }
        }
    }
    
}


struct OnboardingView: View {
    @Binding var onboardingProgress: Int
    let image: String
    let title: String
    let description: String
    let color:  Color
    let nextButton: () -> Void
    
    var body: some View {
        ZStack {
           color.ignoresSafeArea()
            
            VStack {
                
                // MARK: ONBOARDING IMAGE
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.vertical, 20)
                
                VStack(spacing: 20) {
                    
                    // MARK: ONBOARDING TITLE & DESCRIPTION
                    OnboardingDescription(
                        title: title,
                        description: description
                    )
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(
                                width: UIScreen.main.bounds.width / 8,
                                height: 12
                            )
                            .opacity(onboardingProgress == 0 ? 1.0 : 0.4)
                        RoundedRectangle(cornerRadius: 8)
                            .frame(
                                width: UIScreen.main.bounds.width / 16,
                                height: 12
                            )
                            .opacity(onboardingProgress == 1 ? 1.0 : 0.4)
                        RoundedRectangle(cornerRadius: 8)
                            .frame(
                                width: UIScreen.main.bounds.width / 16,
                                height: 12
                            )
                            .opacity(onboardingProgress == 2 ? 1.0 : 0.4)
                    }
                    
                    // MARK: ONBOARDING CONTROL
                    HStack {
                        
                        // MARK: ONBOARDING BACK BUTTON
                        OnboardingButtonComp(buttonType: .skip, title: "Skip") {
                            
                            // do something
                        }
                        
                        Spacer()
                        
                        // MARK: ONBOARDING NEXT BUTTON
                        OnboardingButtonComp(buttonType: .next, title: "Next") {
                            
                            // navigate to next onboarding view
                            nextButton()
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct OnboardingDescription: View {
    let title: String
    let description: String
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 5)
                Text(description)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
        }
    }
}

enum OnboardingButtonType {
    case skip
    case next
}

struct OnboardingButtonStyle: ViewModifier {
    let buttonType: OnboardingButtonType
    func body(content: Content) -> some View {
        switch buttonType {
            case .skip:
                content
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .padding()
                    .padding(.horizontal)
            case .next:
                content
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .padding()
                    .padding(.horizontal)
                    .background(
                        Color.white.cornerRadius(20)
                    )
        }
    }
}

struct OnboardingButtonComp: View {
    let buttonType: OnboardingButtonType
    let title: String
    let buttonAction: () -> Void
    
    var body: some View {
        Button(action: {
            buttonAction()
        }, label: {
            Text(title)
                .modifier(OnboardingButtonStyle(buttonType: buttonType))
                
        })
    }
}

struct Onboarding2: View {
    var body: some View {
        ZStack {
            Color.lightBlue.ignoresSafeArea()
            VStack {
                Text("Hello")
            }
        }
    }
}

struct Onboarding3: View {
    var body: some View {
        Color.lightBrown.ignoresSafeArea()
        ZStack {
            VStack {
                Text("Hello")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
