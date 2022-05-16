

if Station.count == 0
  station = Station.new(name:"door2door", latitude: 52.53, longitude: 13.403, radius: 3.5)
  station.save(:validate=>false)
end

vehicles = Vehicle.create([
                      { uid: 'M85',station_id: 1, route: 'S Lichterfelde', destination: 'door2door'},
                      { uid: 'M48',station_id: 1, route: 'Zelendorf Eiche', destination: 'door2door'},
                      { uid: 'M85',station_id: 1, route: 'door2door', destination: 'S Lichterfelde'},
                      { uid: 'M48',station_id: 1, route: 'door2door', destination: 'Zelendorf Eiche'}
                    ])

location = Location.create([
                            { vehicle_id: 3, latitude: 52.53, longitude: 13.404, angle: '90.0', distance: 0.06764498292203479, direction: 'E', recorded_at: DateTime.now}
                          ])