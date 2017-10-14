# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
                        { firstname:'Marius', lastname:'Lichtblau', email:'marius.lichtblau@googlemail.com', password:'test', password_digest:'test'},
                        { firstname:'Annika', lastname:'Baldi', email:'annika.baldi@googlemail.com', password:'test', password_digest:'test'},
                        { firstname:'Mohammed', lastname:'Husain', email:'mhusain1120@gmail.com', password:'test', password_digest:'test'}
                    ])

groups = Group.create([
                        { name:'Group1' },
                        { name:'Group2' }
                      ])

participations = Participation.create([
                                          {user:users.first, group:groups.first},
                                          {user:users.first, group:groups.second},
                                          {user:users.second, group:groups.first},
                                          {user:users.third, group:groups.second},
                                      ])

scores = Score.create([
                          {user:users.first, score:10},
                          {user:users.first, score:15},
                          {user:users.first, score:20},
                          {user:users.second, score:11},
                          {user:users.second, score:5},
                          {user:users.second, score:3},
                          {user:users.third, score:10},
                          {user:users.third, score:10},
                          {user:users.third, score:30}
                      ])