# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
                        { firstname:'Marius', lastname:'Lichtblau', email:'marius.lichtblau@googlemail.com', password:'test', password_digest:'test', car:'3f77b0dae880ed8d87af21a2cbfa269083bd4be064bda7620a9050b93796e527', car_name:'marius_car'},
                        { firstname:'Annika', lastname:'Baldi', email:'annika.baldi@googlemail.com', password:'test', password_digest:'test', car:'c93bc187df4d7608e940dea90a6d0f2c8dea19d57d02853d665eab174a509ac0', car_name:'annikas_car'},
                        { firstname:'Mohammed', lastname:'Husain', email:'mhusain1120@gmail.com', password:'test', password_digest:'test', car:'ee6c1545969d6e9d13ee21db49e00c1149f00ca18140a9f5e64023eedb5464e1', car_name:'mohammeds_car'}
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
                          {user:users.first, score:50, created_at:"2017-10-10 20:00:00", time:"10/10/2017T23:47:29"},
                          {user:users.second, score:50, created_at:"2017-10-10 20:00:00", time:"10/10/2017T23:47:29"},
                          {user:users.third, score:50, created_at:"2017-10-10 20:00:00", time:"10/10/2017T23:47:29"}
                      ])
